import 'package:dartz/dartz.dart';
import 'package:restaurant_app_sonic/core/functions/handle_api_list.dart';
import 'package:restaurant_app_sonic/features/home/data/models/category_model.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';
import 'package:restaurant_app_sonic/features/home/data/web/home_web_services.dart';

abstract class HomeRepo {
  Future<Either<String, List<CategoryModel>>> getCategories();
  Future<Either<String, List<ProductModel>>> getAllProducts();
  Future<Either<String, List<ProductModel>>> getProductsByCategory(
    int categoryId,
  );
}

class HomeRepoImple extends HomeRepo {
  final HomeWebServices homeWebServices;
  HomeRepoImple({required this.homeWebServices});
  @override
  Future<Either<String, List<CategoryModel>>> getCategories() =>
      handleApiList<CategoryModel>(
        homeWebServices.getCategories,
        (category) => CategoryModel.fromJson(category),
      );

  @override
  Future<Either<String, List<ProductModel>>> getAllProducts() =>
      handleApiList<ProductModel>(
        homeWebServices.getAllProducts,
        (product) => ProductModel.fromJson(product),
      );
  @override
  Future<Either<String, List<ProductModel>>> getProductsByCategory(
    int categoryId,
  ) => handleApiList<ProductModel>(
    () => homeWebServices.getProductsByCategory(categoryId),
    (product) => ProductModel.fromJson(product),
  );
}

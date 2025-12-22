import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app_sonic/core/constants/error_messages.dart';
import 'package:restaurant_app_sonic/features/home/data/models/category_model.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';
import 'package:restaurant_app_sonic/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];

  Future<void> loadHomeData() async {
    emit(HomeLoadingState());

    try {
      final results = await Future.wait([
        homeRepo.getCategories(),
        homeRepo.getAllProducts(),
      ]);
      String? errorMessage;

      final Either<String, List<CategoryModel>> categoriesResult =
          results[0] as Either<String, List<CategoryModel>>;
      final Either<String, List<ProductModel>> productsResult =
          results[1] as Either<String, List<ProductModel>>;
      categoriesResult.fold((error) {
        // emit(HomeFailureState(errorMessage: error));
        errorMessage ??= error;
      }, (data) => categories = data);
      productsResult.fold((error) {
        errorMessage ??= error;
      }, (data) => products = data);

      if (errorMessage != null) {
        emit(HomeFailureState(errorMessage: errorMessage!));
        return;
      }
      emit(
        HomeLoadedState(
          categories: [
            CategoryModel(id: 0, name: "All"),
            ...categories!,
          ],
          products: products!,
        ),
      );
    } on Exception catch (e) {
      emit(HomeFailureState(errorMessage: ErrorMessages.unknown));
    }
  }

  Future<void> getProductsByCategory(int categoryId) async {
    final oldProducts = products;
    emit(
      HomeLoadedState(
        categories: [
          CategoryModel(id: 0, name: "All"),
          ...?categories,
        ],
        products: oldProducts,
        isProductsLoading: true,
      ),
    );
    final result = await homeRepo.getProductsByCategory(categoryId);
    result.fold(
      (error) => emit(HomeFailureState(errorMessage: error)),
      (newProducts) => emit(
        HomeLoadedState(
          categories: [
            CategoryModel(id: 0, name: "All"),
            ...?categories,
          ],
          products: newProducts,
        ),
      ),
    );
  }
}

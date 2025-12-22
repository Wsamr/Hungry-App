// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final bool isProductsLoading;
  HomeLoadedState({
    required this.categories,
    required this.products,
    this.isProductsLoading = false,
  });
}

class HomeFailureState extends HomeState {
  final String errorMessage;
  HomeFailureState({required this.errorMessage});
}

class ProductsLoadingState extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> oldProducts;
  ProductsLoadingState({required this.categories, required this.oldProducts});
}

class ProductsLoadedState extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  ProductsLoadedState({required this.categories, required this.products});
}

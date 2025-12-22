import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/data/models/category_model.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';
import 'package:restaurant_app_sonic/features/home/data/repo/fake_repo.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/categories_list.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/category_loading_widget.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_search_text_field.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_sliver_app_bar.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/product_grid_list.dart';
import 'package:shimmer/shimmer.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    Key? key,
    required this.categories,
    required this.products,
    required this.categoryNotidier,
    required this.categoryId,
    required this.isProductLoading,
  }) : super(key: key);
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final ValueNotifier<int> categoryNotidier;
  final Function(int id) categoryId;
  final bool isProductLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Screen.h * .04),
        CategoriesList(
          category: categories,
          selectedItemNotifer: categoryNotidier,
          id: categoryId,
        ),
        isProductLoading
            ? ProductsLoadingWidget()
            : ProductsGridList(products: products),
      ],
    );
  }
}

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: AppColors.mainColor.withAlpha(1),
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: Screen.h * .04),
            CategoryLoadingWidget(),
            ProductsLoadingWidget(),
          ],
        ),
      ),
    );
  }
}

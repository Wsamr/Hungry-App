import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/data/repo/fake_repo.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/categories_list.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_search_text_field.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_sliver_app_bar.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/product_grid_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Screen.init(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: Screen.h * .03)),
              CustomSliverAppBar(user: user),
              SliverToBoxAdapter(child: SizedBox(height: Screen.h * .01)),
              SliverToBoxAdapter(child: CustomSearchTextField()),
              SliverToBoxAdapter(child: SizedBox(height: Screen.h * .04)),
              SliverToBoxAdapter(child: CategoriesList(category: category)),
              ProductsGridList(),
            ],
          ),
        ),
      ),
    );
  }
}

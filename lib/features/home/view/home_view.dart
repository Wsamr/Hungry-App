import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/categories_list.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_search_text_field.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/product_grid_list.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/sections/header_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> category = [
    "All",
    'Combos',
    "Sliders",
    "Calssic",
    'Combos',
    "Sliders",
    "Calssic",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    int index = 0;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: heightScreen * .04)),
              SliverToBoxAdapter(child: HeaderSection()),
              SliverToBoxAdapter(child: SizedBox(height: heightScreen * .03)),
              SliverToBoxAdapter(child: CustomSearchTextField()),
              SliverToBoxAdapter(child: SizedBox(height: heightScreen * .04)),
              SliverToBoxAdapter(
                child: CategoriesList(
                  widthScreen: widthScreen,
                  heightScreen: heightScreen,
                  category: category,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: heightScreen * .04)),
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: widthScreen * .03,
                ),
                sliver: ProductsGridList(
                  widthScreen: widthScreen,
                  heightScreen: heightScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

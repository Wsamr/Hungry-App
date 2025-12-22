import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/home/cubit/home_cubit.dart';
import 'package:restaurant_app_sonic/features/home/data/repo/fake_repo.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_search_text_field.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_sliver_app_bar.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/home_body_widget.dart';

class HomeViewWe extends StatelessWidget {
  HomeViewWe({super.key});
  final ValueNotifier<int> categoryNotidier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: Screen.h * .03)),
              CustomSliverAppBar(user: user),
              SliverToBoxAdapter(child: SizedBox(height: Screen.h * .01)),
              SliverToBoxAdapter(child: CustomSearchTextField()),
              state is HomeLoadingState
                  ? SliverToBoxAdapter(child: HomeLoadingWidget())
                  : state is HomeFailureState
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          state.errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  : state is HomeLoadedState
                  ? SliverToBoxAdapter(
                      child: HomeBodyWidget(
                        isProductLoading: state.isProductsLoading,
                        categories: state.categories,
                        products: state.products,
                        categoryNotidier: categoryNotidier,
                        categoryId: (id) {
                          if (id == 0) {
                            context.read<HomeCubit>().loadHomeData();
                          } else {
                            context.read<HomeCubit>().getProductsByCategory(id);
                          }
                        },
                      ),
                    )
                  : const SliverToBoxAdapter(child: SizedBox.shrink()),
            ],
          );
        },
      ),
    );
  }
}

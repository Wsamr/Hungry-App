import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/cache_keys.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/user_model.dart';
import 'package:restaurant_app_sonic/features/home/cubit/home_cubit.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_search_text_field.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/custom_sliver_app_bar.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/home_body_widget.dart';
import 'package:restaurant_app_sonic/features/home/view/widgets/user_header_loading.dart';

class HomeViewWe extends StatefulWidget {
  const HomeViewWe({super.key});

  @override
  State<HomeViewWe> createState() => _HomeViewWeState();
}

class _HomeViewWeState extends State<HomeViewWe> {
  final ValueNotifier<int> categoryNotidier = ValueNotifier(0);
  UserModel? user;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  Future<void> _getUserInfo() async {
    final userModelJson = await sl<CacheHelper>().getData(CacheKeys.user);
    if (userModelJson != null) {
      setState(() {
        user = UserModel.jsonToObject(userModelJson);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: Screen.h * .03)),
                user == null
                    ? UserHeaderLoadingSliver()
                    : CustomSliverAppBar(user: user!),
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
                              context.read<HomeCubit>().getProductsByCategory(
                                id,
                              );
                            }
                          },
                        ),
                      )
                    : const SliverToBoxAdapter(child: SizedBox.shrink()),
              ],
            );
          },
        ),
      ),
    );
  }
}

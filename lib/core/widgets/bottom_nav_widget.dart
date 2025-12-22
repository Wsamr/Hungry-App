import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_tab_bar.dart';
import 'package:restaurant_app_sonic/features/cart/views/cart_view.dart';
import 'package:restaurant_app_sonic/features/home/cubit/home_cubit.dart';
import 'package:restaurant_app_sonic/features/home/view/home_view.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/cubit/order_history_cubit.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/views/order_history_view.dart';
import 'package:restaurant_app_sonic/features/profile/cubit/profile_cubit.dart';
import 'package:restaurant_app_sonic/features/profile/view/profile_view.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({super.key});
  final List<Widget> screens = [
    HomeViewWe(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Screen.init(context);
    return DefaultTabController(
      length: screens.length,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<ProfileCubit>(),
            // create: (context) => sl<ProfileCubit>(),
          ),
          BlocProvider(create: (context) => sl<OrderHistoryCubit>()),
          BlocProvider(create: (context) => sl<HomeCubit>()..loadHomeData()),
        ],
        child: Scaffold(
          bottomNavigationBar: CustomTabBar(),
          body: TabBarView(children: screens),
        ),
      ),
    );
  }
}

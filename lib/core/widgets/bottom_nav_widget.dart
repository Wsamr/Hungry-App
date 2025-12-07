import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/utils/screen.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_tab_bar.dart';
import 'package:restaurant_app_sonic/features/cart/views/cart_view.dart';
import 'package:restaurant_app_sonic/features/home/view/home_view.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/cubit/order_history_cubit.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/views/order_history_view.dart';
import 'package:restaurant_app_sonic/features/profile/cubit/profile_cubit.dart';
import 'package:restaurant_app_sonic/features/profile/view/profile_view.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({super.key});
  final List<Widget> screens = const [
    HomeView(),
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
            create: (context) => sl<ProfileCubit>()..getProfileInfo(),
            // create: (context) => sl<ProfileCubit>(),
          ),
          BlocProvider(create: (context) => sl<OrderHistoryCubit>()),
        ],
        child: Scaffold(
          bottomNavigationBar: CustomTabBar(),
          body: TabBarView(children: screens),
        ),
      ),
    );
  }
}

// SvgPicture.asset(AppIcons.homeIcon),
//           Icon(Icons.home),
//           SvgPicture.asset(AppIcons.commentIcon),
//           SvgPicture.asset(AppIcons.userIcon),

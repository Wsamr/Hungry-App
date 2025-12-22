import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_nav_widget.dart';
import 'package:restaurant_app_sonic/features/auth/view/login_view.dart';
import 'package:restaurant_app_sonic/features/auth/view/register_view.dart';
import 'package:restaurant_app_sonic/features/auth/cubit/auth_cubit.dart';
import 'package:restaurant_app_sonic/features/cart/cart_cubit/cart_cubit.dart';
import 'package:restaurant_app_sonic/features/checkOut/check_out_cubit.dart';
import 'package:restaurant_app_sonic/features/checkOut/views/check_out_view.dart';
import 'package:restaurant_app_sonic/features/home/data/models/product_model.dart';
import 'package:restaurant_app_sonic/features/home/view/home_view.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/onboarding_view.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/cubit/order_history_cubit.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/models/order_history_model.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/views/order_details_view.dart';
import 'package:restaurant_app_sonic/features/product/data/repo/product_repo.dart';
import 'package:restaurant_app_sonic/features/product/logic/addtocart_cubit/product_selection_cubit.dart';
import 'package:restaurant_app_sonic/features/product/logic/options_cubit/product_options_cubit.dart';
import 'package:restaurant_app_sonic/features/product/views/product_details_view.dart';
import 'package:restaurant_app_sonic/features/profile/cubit/profile_cubit.dart';
import 'package:restaurant_app_sonic/features/profile/view/profile_view.dart';
import 'package:restaurant_app_sonic/splash_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case RouteNames.onboardingView:
        return MaterialPageRoute(builder: (context) => OnboardingView());
      case RouteNames.productDetailsView:
        ProductModel product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    sl<ProductOptionsCubit>()..getOptionsLists(),
              ),
              BlocProvider(
                create: (context) => ProductSelectionCubit(
                  sl<ProductRepo>(),
                  product.id,
                  double.parse(product.price),
                ),
              ),
            ],
            child: ProductDetailsView(product: product),
          ),
        );
      case RouteNames.checkOutView:
        final String totalPrice = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<CartCubit>()),
              BlocProvider(create: (context) => sl<CheckOutCubit>()),
            ],
            child: CheckOutView(totalPrice: totalPrice),
          ),
        );
      case RouteNames.orderDetaisView:
        OrderHistoryModel order = settings.arguments as OrderHistoryModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: sl<OrderHistoryCubit>(),
            child: OrderDetailsView(order: order),
          ),
        );

      case RouteNames.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => sl<AuthCubit>(),
            child: LoginView(),
          ),
        );
      case RouteNames.resgisterView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: RegisterView(),
          ),
        );
      case RouteNames.homeView:
        return MaterialPageRoute(builder: (context) => HomeViewWe());
      case RouteNames.bottomNavWidget:
        return MaterialPageRoute(builder: (context) => BottomNavWidget());
      case RouteNames.profileView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<ProfileCubit>(),
            child: ProfileView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

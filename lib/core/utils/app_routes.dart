import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/widgets/bottom_nav_widget.dart';
import 'package:restaurant_app_sonic/features/auth/view/login_view.dart';
import 'package:restaurant_app_sonic/features/auth/view/register_view.dart';
import 'package:restaurant_app_sonic/features/auth/cubit/auth_cubit.dart';
import 'package:restaurant_app_sonic/features/home/cubit/home_cubit.dart';
import 'package:restaurant_app_sonic/features/home/view/home_view.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/onboarding_view.dart';
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
        return MaterialPageRoute(builder: (context) => HomeView());
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

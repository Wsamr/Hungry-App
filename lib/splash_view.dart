import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/core/constants/cache_keys.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:svg_flutter/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    checkVisitedAndAuth();
  }

  Future<bool> isVisitedFun() async {
    bool? isVisited = await sl<CacheHelper>().containKey(CacheKeys.isVisited);
    return isVisited;
  }

  void delayedNavigation(context, String path) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
    });
  }

  Future<bool> isAuthorizedFun() async {
    bool? isAuthorized = await sl<CacheHelper>().containKey(CacheKeys.token);
    return isAuthorized;
  }

  checkVisitedAndAuth() async {
    bool isAuthorized = await isAuthorizedFun();
    bool isVisited = await isVisitedFun();
    if (isVisited) {
      if (isAuthorized) {
        delayedNavigation(context, RouteNames.bottomNavWidget);
      } else {
        delayedNavigation(context, RouteNames.loginView);
      }
    } else {
      delayedNavigation(context, RouteNames.onboardingView);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * .3),
          TweenAnimationBuilder(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutBack,
            tween: Tween<double>(begin: size.width * .2, end: size.width * .7),
            builder: (context, value, child) =>
                SvgPicture.asset(AppImages.logoSvg, width: value),
          ),
          Spacer(),
          TweenAnimationBuilder(
            duration: Duration(seconds: 2),
            curve: Curves.easeInCirc,
            tween: Tween<double>(begin: size.width * .2, end: size.width),
            builder: (context, value, child) => Center(
              child: Image.asset(
                AppImages.buragerImg,
                width: value,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

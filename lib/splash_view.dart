import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/onboarding_view.dart';
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
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => OnboardingView()),
        (route) => false,
      );
    });
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

import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/constants/app_colors.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/models/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicatorWidget extends StatelessWidget {
  const OnboardingIndicatorWidget({
    super.key,
    required this.pageController,
    required this.onboardingList,
  });

  final PageController pageController;
  final List<OnboardingModel> onboardingList;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: onboardingList.length,
      effect: SwapEffect(
        type: SwapType.yRotation,
        activeDotColor: AppColors.mainColor,
        dotColor: Colors.black12,
      ),
      onDotClicked: (index) {},
    );
  }
}

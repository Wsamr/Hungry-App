import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/models/onboarding_model.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/widgets/custom_main_text_widget.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/widgets/custom_sub_text_widget.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/widgets/onboarding_indicator_widget.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key, required this.onboardingList});
  final List<OnboardingModel> onboardingList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final PageController pageController = PageController();
    return PageView.builder(
      controller: pageController,
      itemCount: onboardingList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: size.height * .04),
              Image.asset(
                onboardingList[index].imageUrl,
                width: size.width * .8,
              ),
              SizedBox(height: size.height * .01),
              OnboardingIndicatorWidget(
                pageController: pageController,
                onboardingList: onboardingList,
              ),
              SizedBox(height: size.height * .04),
              CustomMainTextWidget(text: onboardingList[index].title),
              SizedBox(height: size.height * .02),
              CustomSubTextWidget(text: onboardingList[index].description),
            ],
          ),
        );
      },
    );
  }
}

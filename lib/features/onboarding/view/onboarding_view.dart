import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/widgets/onboarding_body.dart';
import 'package:restaurant_app_sonic/features/onboarding/view_model/onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});
  final onboardingViewModel = sl<OnboardingViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListenableBuilder(
          listenable: Listenable.merge([onboardingViewModel]),
          builder: (context, child) {
            return OnboardingBody(
              onboardingList: onboardingViewModel.onboardingList,
            );
          },
        ),
      ),
    );
  }
}

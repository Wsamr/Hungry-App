import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/models/onboarding_model.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/repo/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  final OnboardingRepository onboardingRepository;
  List<OnboardingModel> onboardingList = [];
  int currentIndex = 0;
  OnboardingViewModel(this.onboardingRepository) {
    loadData();
  }

  loadData() {
    onboardingList = onboardingRepository.getOnboardingData();
    notifyListeners();
  }

  onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

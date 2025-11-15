import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/models/onboarding_model.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/repo/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  final OnboardingRepository onboardingRepository;
  List<OnboardingModel> onboardingList = [];
  int currentIndex = 0;
  bool isLast = false;
  OnboardingViewModel(this.onboardingRepository) {
    loadData();
  }

  loadData() {
    onboardingList = onboardingRepository.getOnboardingData();
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    lastPage(index);
  }

  lastPage(int index) {
    if (index == onboardingList.length - 1) {
      isLast = true;
    } else {
      isLast = false;
    }
    notifyListeners();
  }
}

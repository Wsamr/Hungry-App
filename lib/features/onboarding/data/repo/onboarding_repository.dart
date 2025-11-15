import 'package:restaurant_app_sonic/core/constants/app_images.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/models/onboarding_model.dart';

class OnboardingRepository {
  List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        imageUrl: AppImages.onboardingImg1,
        title: 'Discover Delicious Meals',
        description: 'Explore a wide variety of foods around you.',
        // color: Colors.white,
      ),
      OnboardingModel(
        imageUrl: AppImages.onboardingImg2,
        title: 'Order Easily',
        description: 'Place your orders in a few taps.',
        // color: AppColors.mainColor,
      ),
      OnboardingModel(
        imageUrl: AppImages.onboardingImg3,
        title: 'Fast Delivery',
        description: 'Get your meals delivered hot and fresh!',
        // color: Colors.white,
      ),
    ];
  }
}

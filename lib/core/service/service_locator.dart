import 'package:get_it/get_it.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/repo/onboarding_repository.dart';
import 'package:restaurant_app_sonic/features/onboarding/view_model/onboarding_view_model.dart';

GetIt sl = GetIt.instance;

setUpServiceLocator() {
  sl.registerLazySingleton(() => OnboardingRepository());
  sl.registerLazySingleton(
    () => OnboardingViewModel(sl<OnboardingRepository>()),
  );
}

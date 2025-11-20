import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/cache_keys.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/widgets/custom_button_widget.dart';
import 'package:restaurant_app_sonic/features/auth/view/login_view.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/models/onboarding_model.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/widgets/custom_main_text_widget.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/widgets/custom_sub_text_widget.dart';
import 'package:restaurant_app_sonic/features/onboarding/view/widgets/onboarding_indicator_widget.dart';
import 'package:restaurant_app_sonic/features/onboarding/view_model/onboarding_view_model.dart';

class OnboardingBody extends StatefulWidget {
  OnboardingBody({
    super.key,
    required this.onboardingList,
    this.isLastOrNot = false,
    this.nextonPressed,
    this.getStartedonPressed,
  });
  final List<OnboardingModel> onboardingList;
  bool isLastOrNot;
  void Function()? getStartedonPressed;
  void Function()? nextonPressed;

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  int index = 0;

  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final onboardingViewModel = sl<OnboardingViewModel>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PageView.builder(
      controller: pageController,
      itemCount: widget.onboardingList.length,
      itemBuilder: (context, index) {
        this.index = index;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: size.height * .13),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.onboardingList[index].imageUrl),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * .01),
              OnboardingIndicatorWidget(
                pageController: pageController,
                onboardingList: widget.onboardingList,
              ),
              SizedBox(height: size.height * .04),
              CustomMainTextWidget(text: widget.onboardingList[index].title),
              SizedBox(height: size.height * .04),
              CustomSubTextWidget(
                text: widget.onboardingList[index].description,
              ),
              Spacer(),
              index == widget.onboardingList.length - 1
                  ? Padding(
                      padding: EdgeInsets.only(bottom: size.height * .1),
                      child: CustomButtonWidget(
                        title: "GetStarted",
                        onPressed: () async {
                          await sl<CacheHelper>().saveData(
                            CacheKeys.isVisited,
                            true,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            RouteNames.loginView,
                          );
                        },
                        size: Size(size.width, size.height * .07),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: size.height * .1),

                      child: CustomButtonWidget(
                        title: "Next",
                        onPressed: () {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        size: Size(size.width, size.height * .07),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

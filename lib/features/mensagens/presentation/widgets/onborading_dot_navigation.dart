import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:campus_connect/core/utils/device.utility.dart';
import 'package:campus_connect/core/utils/sizes.dart';
import 'package:campus_connect/features/login/presentation/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
            effect: ExpandingDotsEffect(
                activeDotColor:
                    isDarkTheme ? Colors.white : TColors.darkBackground,
                dotHeight: 6),
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3));
  }
}

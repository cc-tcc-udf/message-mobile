import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:campus_connect/core/utils/device.utility.dart';
import 'package:campus_connect/core/utils/sizes.dart';
import 'package:campus_connect/features/login/presentation/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnboardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor:
                  isDarkTheme ? Colors.white : TColors.darkBackground),
          child: Icon(
            Icons.arrow_forward_ios,
            color: isDarkTheme ? TColors.darkBackground : Colors.white,
          ),
        ));
  }
}

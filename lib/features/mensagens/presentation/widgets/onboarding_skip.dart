import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:campus_connect/core/utils/device.utility.dart';
import 'package:campus_connect/core/utils/sizes.dart';
import 'package:campus_connect/features/login/presentation/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: Text(
            'Pular',
            style: TextStyle(
                color: isDarkTheme ? Colors.white : TColors.darkBackground,
                fontWeight: FontWeight.w500,
                fontSize: TSizes.md),
          ),
        ));
  }
}

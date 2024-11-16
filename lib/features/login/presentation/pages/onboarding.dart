import 'package:campus_connect/core/utils/image_strings.dart';
import 'package:campus_connect/core/utils/text_strings.dart';
import 'package:campus_connect/features/login/presentation/controllers/onboarding_controller.dart';
import 'package:campus_connect/features/login/presentation/widgets/onboarding_next_button.dart';
import 'package:campus_connect/features/login/presentation/widgets/onboarding_page.dart';
import 'package:campus_connect/features/login/presentation/widgets/onboarding_skip.dart';
import 'package:campus_connect/features/login/presentation/widgets/onborading_dot_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              const OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              const OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: isDarkTheme ? TImages.darkAppLogo : TImages.lightAppLogo,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          //Botão de pular
          const OnBoardingSkip(),

          //Barra de navegação
          const OnBoardingDotNavigation(),

          //Botão de próxima página
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

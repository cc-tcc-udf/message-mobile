import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:campus_connect/core/utils/image_strings.dart';
import 'package:campus_connect/core/utils/sizes.dart';
import 'package:campus_connect/core/utils/spacing_styles.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: AssetImage(isDarkTheme
                        ? TImages.darkAppLogo
                        : TImages.lightAppLogo),
                  ),
                ),
                const SizedBox(
                  height: TSizes.defaultSpace,
                ),
                Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Digite seu email',
                          style: TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        TextFormField(),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        const Text(
                          'Digite sua senha',
                          style: TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        TextFormField(
                          obscureText: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Esqueci minha senha',
                                style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                              )),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        TColors.buttonBackground)),
                                child: const Text('Acessar'))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui cadastro?',
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Se inscreva aqui',
                                  style: TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.underline),
                                )),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

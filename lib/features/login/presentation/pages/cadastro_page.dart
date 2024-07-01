import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:campus_connect/core/design/themes/theme.dart';
import 'package:campus_connect/core/utils/image_strings.dart';
import 'package:campus_connect/core/utils/sizes.dart';
import 'package:campus_connect/core/utils/spacing_styles.dart';
import 'package:campus_connect/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

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
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const Divider(height:2),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Ajuste o espaçamento conforme necessário
                              child: Container(
                                color: isDarkTheme? TColors.darkBackground : Colors.white,
                                child: const Text('Cadastre-se com email e senha'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        const Text(
                          'Nome completo',
                          style: TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        const Text(
                          'RGM',
                          style: TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        const Text(
                          'Email universitário',
                          style: TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        const Text(
                          'Senha',
                          style: TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        const Text(
                          'Confirmar senha',
                          style: TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.to(HomePage());
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        TColors.buttonBackground)),
                                child: const Text('Cadastrar', style: TextStyle(color: Colors.white),))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Já possui cadastro?',
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Faça o login',
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

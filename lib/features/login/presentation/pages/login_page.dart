import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:campus_connect/core/utils/image_strings.dart';
import 'package:campus_connect/core/utils/sizes.dart';
import 'package:campus_connect/core/utils/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design/alerts/modal_alert.dart';
import '../../../../routes.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final LoginController controller = GetIt.I.get<LoginController>();
    // final GlobalKey<FormState> formLogin = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
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
                      TextFormField(
                        controller: emailController,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                      ),
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
                          controller: senhaController,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
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
                              onPressed: () async {
                                  await controller.login(
                                      email: emailController.text,
                                      senha: senhaController.text);
                                  if (controller.loginEntity == null) {
                                    _showDialog(
                                        context,
                                        message: 'CPF e/ou senha inválidos');
                                  } else {
                                    Navigator.of(context).pushNamedAndRemoveUntil(
                                      Routes.initial,
                                          (Route<dynamic> route) => false,
                                    );
                                  }
                              },

                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      TColors.buttonBackground)),
                              child: const Text('Acessar', style: TextStyle(color: Colors.white),))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui cadastro?',
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(Routes.cadastro);
                              },
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
    );
  }

  void _showDialog(BuildContext context, {required String message}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ModalAlertWidget(
            message: message,
          );
        });
  }

}
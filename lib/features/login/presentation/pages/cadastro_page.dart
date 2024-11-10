import 'package:brasil_fields/brasil_fields.dart';
import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:campus_connect/core/utils/image_strings.dart';
import 'package:campus_connect/core/utils/sizes.dart';
import 'package:campus_connect/core/utils/spacing_styles.dart';
import 'package:campus_connect/features/login/data/models/cadastro_usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../../routes.dart';
import '../controllers/login_controller.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final LoginController controller = GetIt.I.get<LoginController>();
  bool senhaNaoConfere = false;

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
                            const Divider(height: 2),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                color: isDarkTheme ? TColors.darkBackground : Colors.white,
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
                            controller: controller.nome,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        const Text(
                          'Telefone',
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
                            controller: controller.telefone,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
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
                            controller: controller.email,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
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
                            controller: controller.senha,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
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
                            controller: controller.confirmar,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            obscureText: true,
                          ),
                        ),
                        if (senhaNaoConfere)
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              'As senhas não conferem',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        const SizedBox(
                          height: TSizes.spaceBtwItens,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                senhaNaoConfere = controller.senha.text != controller.confirmar.text;
                              });

                              if (!senhaNaoConfere) {
                                var usuario = CadastroUsuarioModel(
                                  name: controller.nome.text,
                                  phone: controller.telefone.text,
                                  email: controller.email.text,
                                  password: controller.senha.text,
                                  active: true
                                );
                                await controller.cadastrar(usuario);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  Routes.login,
                                      (Route<dynamic> route) => false,
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(TColors.buttonBackground),
                            ),
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
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
                              ),
                            ),
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

import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:campus_connect/core/utils/image_strings.dart';
import 'package:campus_connect/core/utils/sizes.dart';
import 'package:campus_connect/core/utils/spacing_styles.dart';
import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design/alerts/modal_alert.dart';
import '../../../../routes.dart';
import '../../../service/notification_service.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode senhaFocusNode = FocusNode();
  final LoginController controller = GetIt.I.get<LoginController>();
  final UsuarioController userController = GetIt.I<UsuarioController>();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    emailFocusNode.dispose();
    senhaFocusNode.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    await controller.login(
      email: emailController.text,
      senha: senhaController.text,
    );

    if (controller.loginEntity != null) {
      await userController.getDataUser();
    }

    setState(() {
      isLoading = false;
    });

    if (controller.loginEntity == null) {
      _showDialog(
        context,
        message: 'CPF e/ou senha inválidos',
      );
    } else {
      if (userController.usuario?.course?.id == null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.escolherCursos,
          (Route<dynamic> route) => false,
        );
      } else {
        LocalNotificationService().registerFirebaseFromLogin();
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.initial,
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    image: AssetImage(
                      isDarkTheme ? TImages.darkAppLogo : TImages.lightAppLogo,
                    ),
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
                        focusNode: emailFocusNode,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(senhaFocusNode);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300), // Define a borda
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                        ),
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
                        focusNode: senhaFocusNode,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300), // Define a borda
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItens,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: GestureDetector(
                          onTap: isLoading ? null : _login,
                          child: Container(
                            decoration: BoxDecoration(
                              color: isLoading
                                  ? Colors.grey[100]
                                  : TColors.buttonBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          TColors.buttonBackground),
                                    ),
                                  )
                                : const Text(
                                    'Acessar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Não possui cadastro?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.cadastro);
                            },
                            child: const Text(
                              'Se inscreva aqui',
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
      },
    );
  }
}

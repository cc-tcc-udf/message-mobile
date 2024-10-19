import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/design/widgets/s_app_bar.dart';
import '../../core/utils/sizes.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  UsuarioController usuarioController = GetIt.I<UsuarioController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(null, context: context, titleText: 'Perfil'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Center(
                  child: Icon(Icons.file_upload_outlined, size: 40),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(child: Text('Foto do perfil')),
            Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
    );
  }
}

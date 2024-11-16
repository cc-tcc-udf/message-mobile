import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect/core/design/widgets/loading_widget.dart';
import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/design/themes/colors.dart';
import '../../core/localstorage/security_local_storage.dart';
import '../../core/localstorage/security_shared_preference.dart';
import '../../routes.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  UsuarioController usuarioController = GetIt.I<UsuarioController>();
  bool _isLoading = true; // Controlador de carregamento

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SecurityLocalStorage storage = SecuritySharedPreference();
    var email = await storage.read("email");
    try {
      await usuarioController.getDataUser(email: email);
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 16),
                        child: _isLoading
                            ? Container()
                            : Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.perfil,
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: TColors.buttonBackground,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(50),
                                              image: usuarioController.usuario?.profilePhoto?.url != null
                                                  ? DecorationImage(
                                                image: NetworkImage(usuarioController.usuario!.profilePhoto!.url!),
                                                fit: BoxFit.cover,
                                              )
                                                  : null,
                                            ),
                                            child: usuarioController.usuario?.profilePhoto?.url == null
                                                ? const Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            )
                                                : null,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0),
                                            child: SizedBox(
                                              height: 60,
                                              width: MediaQuery.of(context).size.width * 0.60,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      usuarioController.usuario!.name!,
                                                      style: const TextStyle(fontSize: 18, color: Colors.white),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      usuarioController.usuario!.course!.name!,
                                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Align(
                                        alignment: Alignment.bottomRight,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Acessar perfil',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            Icon(Icons.arrow_forward, color: Colors.white, size: 15),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.tema,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: TColors.buttonBackground,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.brightness_medium, color: Colors.white, size: 20),
                                            SizedBox(width: 10),
                                            Text('Tema', style: TextStyle(color: Colors.white)),
                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.termos,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: TColors.buttonBackground,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.description_outlined, color: Colors.white, size: 20),
                                            SizedBox(width: 10),
                                            Text(
                                              'Termos e Política de Privacidade',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.login,
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 40,
                            decoration: BoxDecoration(
                              color: TColors.buttonBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout, color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text(
                                  'Sair',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Theme.of(context).brightness == Brightness.light
                            ? Image.asset(
                          'assets/images/on_boarding_images/campus_connect_black.png',
                          width: 100,
                        )
                            : Image.asset(
                          'assets/images/on_boarding_images/campus_connect_white.png',
                          width: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text('Versão 1.0.0'),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          if (_isLoading)
            const Center(child: LoadingWidget()),
        ],
      ),
    );
  }
}

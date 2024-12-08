import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../features/mensagens/presentation/pages/mensagem_page.dart';
import '../../../features/mensagens/presentation/pages/mensagens_favoritas_page.dart';
import '../../../features/mensagens/presentation/pages/mensagens_lidas_page.dart';
import '../../../features/usuarios/presentation/controllers/usuario_controller.dart';
import '../../../routes.dart';
import '../themes/colors.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final UsuarioController _usuarioController = GetIt.I.get<UsuarioController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? TColors.darkBackground
            : Colors.white,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: TColors.buttonBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _usuarioController.usuario?.profilePhoto?.url != null
                        ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        _usuarioController.usuario!.profilePhoto!.url!,
                      ),
                      radius: 30,
                    )
                        : const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person, size: 30),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _usuarioController.usuario?.name ?? 'Usuário',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      _usuarioController.usuario?.course?.name ?? 'Curso',
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text('Mensagens'),
                    onTap: () {
                      Navigator.pop(context); // Fecha o Drawer
                      Get.to(const MensagemPage());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text('Favoritas'),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(const MensagensFavoritasPage());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.mark_email_read),
                    title: const Text('Lidas'),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(const MensagensLidasPage());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Configurações'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Routes.configuracoes);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () {
                // Lógica para logout
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

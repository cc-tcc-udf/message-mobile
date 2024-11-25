import 'package:campus_connect/core/design/widgets/loading_widget.dart';
import 'package:campus_connect/features/mensagens/presentation/controllers/mensagem_controller.dart';
import 'package:campus_connect/features/mensagens/presentation/pages/mensagem_page.dart';
import 'package:campus_connect/features/mensagens/presentation/pages/mensagens_favoritas_page.dart';
import 'package:campus_connect/features/mensagens/presentation/pages/mensagens_lidas_page.dart';
import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design/themes/colors.dart';
import '../../../../core/design/widgets/drawer_widget.dart';
import '../../../../routes.dart';
import '../../../mensagens/data/models/mensagem_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final UsuarioController _usuarioController = GetIt.I.get<UsuarioController>();
  final MensagemController _controller = GetIt.I.get<MensagemController>();
  List<MessageData>? _mensagem = [];
  late Future<void> _loadMensagemFuture;
  late int index;

  @override
  void initState() {
    super.initState();
    _usuarioController.getDataUser();
    _loadMensagem();
    _loadMensagemFuture = _loadMensagem();
  }

  Future<void> _loadMensagem() async {
    await _controller.listarMensagens(_usuarioController.usuario!.course!.id!);
    setState(() {
      _mensagem = _controller.mensagem?.data;
      index = _controller.mensagem!.data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      drawer: const DrawerWidget(),
      body: FutureBuilder<void>(
        future: _loadMensagemFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoadingWidget(),
            );
          } else {
            return Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Olá!!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50),
                              image: _usuarioController
                                          .usuario?.profilePhoto?.url !=
                                      null
                                  ? DecorationImage(
                                      image: NetworkImage(
                                        _usuarioController
                                            .usuario!.profilePhoto!.url!,
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child:
                                _usuarioController.usuario?.profilePhoto?.url ==
                                        null
                                    ? const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : null,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _usuarioController.usuario!.name!,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _usuarioController.usuario!.course!.name!,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: GridView.count(
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const MensagemPage());
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: TColors.buttonBackground,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '$index',
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Mensagens não lidas',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const MensagensFavoritasPage());
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: TColors.buttonBackground,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '$index',
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Favoritas',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const MensagensLidasPage());
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: TColors.buttonBackground,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '$index',
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Mensagens lidas',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

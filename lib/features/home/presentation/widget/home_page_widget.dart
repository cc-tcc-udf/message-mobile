import 'package:campus_connect/core/design/widgets/loading_widget.dart';
import 'package:campus_connect/core/utils/device.utility.dart';
import 'package:campus_connect/features/mensagens/presentation/controllers/mensagem_controller.dart';
import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../routes.dart';
import '../../../mensagens/data/models/mensagem_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  UsuarioController _usuarioController = GetIt.I.get<UsuarioController>();
  MensagemController _controller = GetIt.I.get<MensagemController>();
  List<MessageData>? _mensagem = [];
  late Future<void> _loadMensagemFuture;
  late int index;

  @override
  void initState() {
    super.initState();
    _loadMensagem();
    _loadMensagemFuture = _loadMensagem();
  }

  Future<void> _loadMensagem() async {
    await _controller.listarMensagens();
    setState(() {
      _mensagem = _controller.mensagem?.data;
      index = _controller.mensagem!.data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          child: FutureBuilder<void>(
            future: _loadMensagemFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo campus connect 1.png',
                      width: 100,
                      height: 100,
                    ),
                    const Text(
                      'Seja bem-vindo(a)!!',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      _usuarioController.usuario!.name!,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _usuarioController.usuario!.course!.name!,
                      style: const TextStyle(fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('Recentes ($index)', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                    ),
                    ListView.builder(
                      itemCount: _controller.mensagem?.data.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final mensagem = _controller.mensagem!.data[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(
                              context,
                              Routes.detalheMensagem,
                              arguments: {
                                'id': mensagem.id,
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mensagem.title,
                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        TDeviceUtils.truncateWithEllipsis(200, mensagem.summary),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 8,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.10,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.remove_red_eye_outlined),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

}

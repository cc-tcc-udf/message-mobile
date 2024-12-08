import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design/widgets/loading_widget.dart';
import '../../../../core/utils/device.utility.dart';
import '../../../../routes.dart';
import '../../../usuarios/presentation/controllers/usuario_controller.dart';
import '../../../mensagens/data/models/mensagem_model.dart';
import '../controllers/mensagem_controller.dart';

class MensagensLidasPage extends StatefulWidget {
  const MensagensLidasPage({super.key});

  @override
  State<MensagensLidasPage> createState() => _MensagensLidasPageState();
}

class _MensagensLidasPageState extends State<MensagensLidasPage> {
  final UsuarioController _usuarioController = GetIt.I.get<UsuarioController>();
  final MensagemController _controller = GetIt.I.get<MensagemController>();
  List<MessageData>? _mensagem = [];
  late Future<void> _loadMensagemFuture;
  late int index;
  bool _showAllMessages = false;

  @override
  void initState() {
    super.initState();
    _loadMensagem();
    _loadMensagemFuture = _loadMensagem();
  }

  Future<void> _loadMensagem() async {
    await _controller.listarMensagens(_usuarioController.usuario!.id!, 'reads');
    setState(() {
      _mensagem = _controller.mensagem?.data;
      index = _controller.mensagem!.data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.initial,
                  (Route<dynamic> route) => false,
            );
          },
        ),
        title: Observer(
          builder: (context) {
            return Text(
              _controller.isLoading
                  ? ''
                  : 'Mensagens lidas ($index)',
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          child: Column(
            children: [
              FutureBuilder<void>(
                future: _loadMensagemFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (Scaffold.of(context).appBarMaxHeight ?? kToolbarHeight),
                      child: const Column(
                        children: [
                          Spacer(flex: 3),
                          LoadingWidget(),
                          Spacer(flex: 5),
                        ],
                      ),
                    );

                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_mensagem == null || _mensagem!.isEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Column(
                                children: [
                                  Image.asset('assets/images/message_null.png'),
                                  const Text(
                                    'Nenhuma mensagem disponível para leitura.',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Column(
                            children: [
                              ListView.builder(
                                itemCount:_controller.mensagem?.data.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final mensagem = _controller.mensagem!.data[index];
                                  return GestureDetector(
                                    onTap: () {
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
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mensagem.title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              TDeviceUtils.truncateWithEllipsis(200, mensagem.summary),
                                              style: const TextStyle(fontSize: 12, color: Colors.black),
                                            ),
                                            const SizedBox(height: 8),
                                            const Align(
                                              alignment: Alignment.bottomRight,
                                              child: Icon(Icons.arrow_forward_rounded, color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

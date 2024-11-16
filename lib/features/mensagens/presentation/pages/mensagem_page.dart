import 'package:campus_connect/core/design/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design/widgets/loading_widget.dart';
import '../../../../core/utils/device.utility.dart';
import '../../../../routes.dart';
import '../../../usuarios/presentation/controllers/usuario_controller.dart';
import '../../../mensagens/data/models/mensagem_model.dart';
import '../controllers/mensagem_controller.dart';

class MensagemPage extends StatefulWidget {
  const MensagemPage({super.key});

  @override
  State<MensagemPage> createState() => _MensagemPageState();
}

class _MensagemPageState extends State<MensagemPage> {
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
          child: Column(
            children: [
              FutureBuilder<void>(
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
                        Theme.of(context).brightness == Brightness.light
                            ? Image.asset(
                          'assets/images/logo campus connect 1.png',
                          width: 100,
                          height: 100,
                        )
                            : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/images/loading_dark.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _usuarioController.usuario!.course!.name!,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Não Lidas ($index)',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
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
                                itemCount: _showAllMessages
                                    ? _controller.mensagem?.data.length ?? 0
                                    : (_controller.mensagem?.data.length ?? 0).clamp(0, 2),
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
                                                  style: const TextStyle(
                                                      fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  TDeviceUtils.truncateWithEllipsis(200, mensagem.summary),
                                                  style: const TextStyle(fontSize: 12, color: Colors.black),
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
                                              child: const Icon(Icons.remove_red_eye_outlined, color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              if ((_controller.mensagem?.data.length ?? 0) > 2)
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _showAllMessages = !_showAllMessages;
                                    });
                                  },
                                  child: Text(
                                    _showAllMessages ? 'Ver menos' : 'Ver mais',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? Colors.white
                                          : TColors.buttonBackground,
                                    ),
                                  ),
                                ),

                            ],
                          ),
                      ],
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
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
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'Mensagens anteriores',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
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
                            ListView.builder(
                              itemCount: _controller.mensagem?.data.length ?? 0,
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
                                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                TDeviceUtils.truncateWithEllipsis(200, mensagem.summary),
                                                style: const TextStyle(fontSize: 12, color: Colors.black),
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
                                            child: const Icon(Icons.remove_red_eye_outlined, color: Colors.black),
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:campus_connect/features/mensagens/presentation/controllers/mensagem_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/design/widgets/s_app_bar.dart';
import '../../../../core/design/widgets/loading_widget.dart';

class DetalheMensagemPage extends StatefulWidget {
  DetalheMensagemPage({super.key, required this.id});

  final int id;

  @override
  State<DetalheMensagemPage> createState() => _DetalheMensagemPageState();
}

class _DetalheMensagemPageState extends State<DetalheMensagemPage> {
  final MensagemController _controller = GetIt.I<MensagemController>();

  @override
  void initState() {
    super.initState();
    _controller.detalhesMensagem(widget.id);
  }

  void _showConfirmationDialog(String link) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Atenção!'),
          content: const Text('Este link será aberto em um navegador externo. Deseja continuar?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                _launchURL(link);
                Navigator.of(context).pop();
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Observer(
          builder: (context) {
            return Text(
              _controller.isLoading
                  ? ''
                  : _controller.detalheMensagem?.data!.title ?? 'Erro ao carregar',
            );
          },
        ),
      ),
      body: Observer(
        builder: (context) {
          if (_controller.isLoading) {
            return Center(
              child: LoadingWidget(),
            );
          } else if (_controller.detalheMensagem != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text('Quarta-Feira, 17/04/2024', style: TextStyle(fontWeight: FontWeight.w300)),
                    ),
                    Html(data: _controller.detalheMensagem!.data!.message!),
                    if (_controller.detalheMensagem!.data!.links!.isNotEmpty) ...[
                      const Text('Links:', style: TextStyle(fontWeight: FontWeight.w700)),
                      ListView.builder(
                        itemCount: _controller.detalheMensagem?.data!.links!.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final links = _controller.detalheMensagem!.data!.links![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (links.link!.startsWith('http://') || links.link!.startsWith('https://')) {
                                  _showConfirmationDialog(links.link!);
                                } else {
                                  print('URL inválido: ${links.link}');
                                }
                              },
                              child: Row(
                                children: [
                                  Text(
                                    links.title!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.open_in_new, size: 20, color: Colors.blue),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                    if (_controller.detalheMensagem!.data!.attachments!.isNotEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text('Anexos:', style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      ListView.builder(
                        itemCount: _controller.detalheMensagem?.data!.attachments!.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final attachment = _controller.detalheMensagem!.data!.attachments![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (attachment.link!.startsWith('http://') || attachment.link!.startsWith('https://')) {
                                  _showConfirmationDialog(attachment.link!);
                                } else {
                                  print('URL inválido: ${attachment.link}');
                                }
                              },
                              child: Row(
                                children: [
                                  Text(
                                    attachment.title!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.open_in_new, size: 20, color: Colors.blue),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Erro ao carregar detalhes da mensagem'),
            );
          }
        },
      ),
    );
  }
}

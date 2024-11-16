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

  void _showBottomSheet(String link) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: const Icon(Icons.open_in_new, size: 60),
              ),
              const Text(
                'Atenção!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 16),
              const Text('Você será redirecionado para o ambiente externo. Deseja continuar?', style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.5),
                        ),
                      ),
                      child: const Text('Não', style: TextStyle(color: Colors.black),),
                    ),
                  ),

                  const SizedBox(width: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        _launchURL(link);
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.5),
                        ),
                      ),
                      child: const Text('Sim', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Observer(
          builder: (context) {
            return Text(
              _controller.isLoading
                  ? ''
                  : _controller.detalheMensagem?.data?.title ?? 'Erro ao carregar',
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
                                  _showBottomSheet(links.link!);
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
                                  _showBottomSheet(attachment.link!);
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

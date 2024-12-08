import 'package:campus_connect/features/mensagens/data/models/envio_view_favorite_model.dart';
import 'package:campus_connect/features/mensagens/presentation/controllers/mensagem_controller.dart';
import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../core/design/widgets/loading_widget.dart';
import '../../../../core/utils/device.utility.dart';

class DetalheMensagemPage extends StatefulWidget {
  const DetalheMensagemPage({super.key, required this.id});

  final String id;

  @override
  State<DetalheMensagemPage> createState() => _DetalheMensagemPageState();
}

class _DetalheMensagemPageState extends State<DetalheMensagemPage> {
  final MensagemController _controller = GetIt.I<MensagemController>();
  final UsuarioController _usuarioController = GetIt.I<UsuarioController>();

  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  Future<void> _initializePage() async {
    await _initializeLocale();
    await _usuarioController.getDataUser();
    print(widget.id);

    await _controller.detalhesMensagem(widget.id, _usuarioController.usuario!.id!);

    if (_controller.detalheMensagem != null) {
      _controller.favorito = _controller.detalheMensagem!.data?.favorite ?? false;

      if (_controller.detalheMensagem!.data?.read == false) {
        final envio = EnvioViewFavoriteModel(
          user: _usuarioController.usuario!.id!,
          message: widget.id,
          favorite: false,
          view: true,
        );
        await _controller.viewFavorite(envio);
      }
    }

    setState(() {});
  }


  Future<void> favoritar() async {
    _controller.favorito = !_controller.favorito;

    EnvioViewFavoriteModel envio = EnvioViewFavoriteModel(
      user: _usuarioController.usuario!.id!,
      message: widget.id,
      favorite: _controller.favorito,
      view: true,
    );
    await _controller.viewFavorite(envio);
  }




  Future<void> _initializeLocale() async {
    await initializeDateFormatting('pt_BR', null);
  }

  String _getFormattedText(String text) {
    if (text.isNotEmpty) {
      String truncatedText = text.length > 20
          ? '${text.substring(0, 16)}...${text.substring(text.length - 10)}'
          : text;

      String formattedText = truncatedText[0].toUpperCase() +
          truncatedText.substring(1).toLowerCase();

      return formattedText;
    }
    return text;
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Icon(Icons.open_in_new, size: 60),
              ),
              const Text(
                'Atenção!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 16),
              const Text(
                'Você será redirecionado para o ambiente externo. Deseja continuar?',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
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
                      child: const Text(
                        'Não',
                        style: TextStyle(color: Colors.black),
                      ),
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
                      child: const Text(
                        'Sim',
                        style: TextStyle(color: Colors.white),
                      ),
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

  String _formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    final DateFormat formatter = DateFormat('EEEE, d MMMM y', 'pt_BR');
    return formatter.format(parsedDate);
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
                  : _controller.detalheMensagem?.data?.title ??
                      'Erro ao carregar',
            );
          },
        ),
      ),
      body: Observer(
        builder: (context) {
          if (_controller.isLoading) {
            return const Center(
              child: LoadingWidget(),
            );
          } else if (_controller.detalheMensagem != null) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: favoritar,
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 110,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _controller.favorito ? Icons.star : Icons.star_border_rounded,
                                    color: _controller.favorito ? Colors.yellow : Colors.black,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(_controller.favorito ? 'Favorito' : 'Favoritar'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_controller.detalheMensagem?.data?.sendDate != null) ...[
                          Text(
                            _formatDate(
                                _controller.detalheMensagem!.data!.sendDate!),
                            style: const TextStyle(fontWeight: FontWeight.w300),
                          )
                        ],
                      ],
                    ),

                    Html(data: _controller.detalheMensagem!.data!.message!),
                    if (_controller
                        .detalheMensagem!.data!.links!.isNotEmpty) ...[
                      const Text('Links:',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      ListView.builder(
                        itemCount:
                            _controller.detalheMensagem?.data!.links!.length ??
                                0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final links =
                              _controller.detalheMensagem!.data!.links![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              height: 50,
                              child: GestureDetector(
                                onTap: () {
                                  if (links.link!.startsWith('http://') ||
                                      links.link!.startsWith('https://')) {
                                    _showBottomSheet(links.link!);
                                  } else {
                                    if (kDebugMode) {
                                      print('URL inválido: ${links.link}');
                                    }
                                  }
                                },
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          TDeviceUtils.truncateWithEllipsis(
                                              38, links.title!),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(Icons.open_in_new,
                                            size: 20, color: Colors.blue),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                    if (_controller
                        .detalheMensagem!.data!.attachments!.isNotEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text('Anexos:',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      ListView.builder(
                        itemCount: (_controller
                                    .detalheMensagem?.data!.attachments!
                                    .where((attachment) =>
                                        attachment.type!.startsWith('image/'))
                                    .length ??
                                0) +
                            (_controller.detalheMensagem?.data!.attachments!
                                    .where((attachment) =>
                                        !attachment.type!.startsWith('image/'))
                                    .length ??
                                0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var nonImageAttachments = _controller
                              .detalheMensagem!.data!.attachments!
                              .where((attachment) =>
                                  !attachment.type!.startsWith('image/'))
                              .toList();

                          var imageAttachments = _controller
                              .detalheMensagem!.data!.attachments!
                              .where((attachment) =>
                                  attachment.type!.startsWith('image/'))
                              .toList();

                          var allAttachments = [
                            ...nonImageAttachments,
                            ...imageAttachments
                          ];

                          final attachment = allAttachments[index];
                          bool isImage =
                              attachment.type!.startsWith('image/');

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (!isImage) {
                                  if (attachment.url!.startsWith('http://') ||
                                      attachment.url!.startsWith('https://')) {
                                    _showBottomSheet(attachment.url!);
                                  } else {
                                    if (kDebugMode) {
                                      print('URL inválido: ${attachment.url}');
                                    }
                                  }
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (isImage)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        attachment.url!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    )
                                  else
                                    SizedBox(
                                      height: 50,
                                      child: Card(
                                        elevation: 3,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    _getFormattedText(
                                                        attachment.name!),
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 10),
                                              const Icon(Icons.open_in_new,
                                                  size: 20, color: Colors.blue),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
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

import 'package:campus_connect/features/mensagens/presentation/controllers/mensagem_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

import '../../core/design/widgets/s_app_bar.dart';

class TermosEPoliticaPage extends StatefulWidget {
  const TermosEPoliticaPage({super.key});

  @override
  State<TermosEPoliticaPage> createState() => _TermosEPoliticaPageState();
}

class _TermosEPoliticaPageState extends State<TermosEPoliticaPage> {
  final MensagemController _controller = GetIt.I<MensagemController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(context: context, titleText: 'Termos e política de privacidade'),
      body: SingleChildScrollView(child: Html(data: _controller.termos)),
    );
  }
}

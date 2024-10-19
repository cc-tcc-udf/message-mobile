import 'package:flutter/material.dart';

import '../../core/design/widgets/s_app_bar.dart';

class TermosEPoliticaPage extends StatefulWidget {
  const TermosEPoliticaPage({super.key});

  @override
  State<TermosEPoliticaPage> createState() => _TermosEPoliticaPageState();
}

class _TermosEPoliticaPageState extends State<TermosEPoliticaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(null, context: context, titleText: 'Termos e política de privacidade'),
    );
  }
}

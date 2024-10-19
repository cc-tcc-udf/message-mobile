import 'package:flutter/material.dart';

import '../../core/design/widgets/s_app_bar.dart';

class TemaPage extends StatefulWidget {
  const TemaPage({super.key});

  @override
  State<TemaPage> createState() => _TemaPageState();
}

class _TemaPageState extends State<TemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(null, context: context, titleText: 'Tema'),
    );
  }
}

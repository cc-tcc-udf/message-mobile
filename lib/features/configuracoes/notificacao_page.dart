import 'package:flutter/material.dart';

import '../../core/design/widgets/s_app_bar.dart';

class NotificacaoPage extends StatefulWidget {
  const NotificacaoPage({super.key});

  @override
  State<NotificacaoPage> createState() => _NotificacaoPageState();
}

class _NotificacaoPageState extends State<NotificacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(null, context: context, titleText: 'Notificações'),
    );
  }
}

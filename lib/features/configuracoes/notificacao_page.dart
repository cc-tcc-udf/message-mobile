import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/design/widgets/s_app_bar.dart';
import '../../core/utils/image_strings.dart';

class NotificacaoPage extends StatefulWidget {
  const NotificacaoPage({super.key});

  @override
  State<NotificacaoPage> createState() => _NotificacaoPageState();
}

class _NotificacaoPageState extends State<NotificacaoPage> {
  bool _isNotificationsEnabled = true;

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Tem certeza que deseja desativar as notificações?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isNotificationsEnabled = false;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(null, context: context, titleText: 'Notificações'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              children: [
                Image(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  image: const AssetImage(TImages.notificacoesImage),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_isNotificationsEnabled) {
                          _showConfirmationDialog();
                        } else {
                          setState(() {
                            _isNotificationsEnabled = !_isNotificationsEnabled;
                          });
                        }
                      },
                      child: Container(
                        width: 30,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _isNotificationsEnabled ? Colors.white : Colors.grey[300],
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Stack(
                          children: [
                            AnimatedAlign(
                              alignment: _isNotificationsEnabled ? Alignment.centerRight : Alignment.centerLeft,
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _isNotificationsEnabled ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: AutoSizeText(
                        'Desejo receber notificações push sobre as mensagens enviadas',
                        style: TextStyle(fontSize: 12),
                        maxLines: 2,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

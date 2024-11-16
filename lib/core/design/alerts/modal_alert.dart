import 'package:flutter/material.dart';

class ModalAlertWidget extends StatelessWidget {
  final String message;
  const ModalAlertWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      backgroundColor: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(16),
        child: Text(message, style: const TextStyle(fontSize: 16,
          color: Colors.black,
          letterSpacing: 1,)),
      ),
    );
  }
}

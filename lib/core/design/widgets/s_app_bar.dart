import 'package:flutter/material.dart';

class SAppBar extends AppBar {
  final String titleText;
  final BuildContext context;

  SAppBar({required this.context, required this.titleText, super.key})
      : super(
    title: Text(
      titleText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ),
    ),
    elevation: 20,
    toolbarHeight: 83,
  );
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class SAppBar extends AppBar {
  final String titleText;
  @override
  // ignore: overridden_fields
  final List<Widget>? actions;
  final BuildContext context;
  SAppBar(this.actions,
      {required this.context, required this.titleText, super.key})
      : super(
    title: Text(
      titleText,
      style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    ),
    actions: actions,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 20,
    toolbarHeight: 83,
  );
}

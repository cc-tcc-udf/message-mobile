import 'package:flutter/material.dart';

import '../../../routes.dart';

class AppBarMenu extends AppBar {
  final String titleText;
  @override
  final List<Widget>? actions;
  final BuildContext context;

  AppBarMenu(this.actions, {required this.context, required this.titleText, super.key})
      : super(
    title: Text(
      titleText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    actions: actions,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.initial,
                (Route<dynamic> route) => false,
          );
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

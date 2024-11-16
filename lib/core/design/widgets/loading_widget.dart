import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final String imagePath = isDarkMode
        ? 'assets/images/loading_dark.png'
        : 'assets/images/loading_light.png';

    return Center(
      child: RotationTransition(
        turns: Tween<double>(begin: 0.0, end: 1.0).animate(_controller),
        child: Image.asset(
          imagePath,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}

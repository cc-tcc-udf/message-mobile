import 'package:flutter/material.dart';

import '../themes/colors.dart';

class SBottomNavigationBar extends StatelessWidget {
  final bool preenchido;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final List<BottomNavigationBarItem> items;

  const SBottomNavigationBar({
    super.key,
    required this.preenchido,
    required this.currentIndex,
    required this.onTap,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.buttonBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          int index = items.indexOf(item);
          bool isSelected = index == currentIndex;

          // Aplicando o tema do ícone corretamente
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconTheme(
                    data: IconThemeData(
                      color: isSelected
                          ? selectedItemColor // Cor do ícone selecionado
                          : unselectedItemColor, // Cor do ícone não selecionado
                    ),
                    child: item.icon, // Aplica a cor ao ícone
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label ?? '',
                    style: TextStyle(
                      color: isSelected
                          ? selectedItemColor // Cor do texto selecionado
                          : unselectedItemColor, // Cor do texto não selecionado
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


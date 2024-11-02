import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importando o SharedPreferences

import '../../core/design/themes/colors.dart';
import '../../core/design/widgets/s_app_bar.dart';
import '../../main.dart';

class TemaPage extends StatefulWidget {
  const TemaPage({super.key});

  @override
  State<TemaPage> createState() => _TemaPageState();
}

class _TemaPageState extends State<TemaPage> {
  String? selectedTheme;

  @override
  void initState() {
    super.initState();
    _loadSelectedTheme();
  }

  Future<void> _loadSelectedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('selectedTheme');

    if (theme != null) {
      _selectTheme(theme);
    } else {
      // Aqui você não deve usar o context. Em vez disso, você pode definir o tema padrão como 'system'.
      _selectTheme('system');  // Ou 'light', se preferir
    }
  }

  void _selectTheme(String theme) async {
    setState(() {
      selectedTheme = theme;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedTheme', theme);

    if (theme == 'light') {
      themeNotifier.value = ThemeMode.light;
    } else if (theme == 'dark') {
      themeNotifier.value = ThemeMode.dark;
    } else if (theme == 'system') {
      themeNotifier.value = ThemeMode.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedTheme == null) {
      String defaultTheme = MediaQuery.of(context).platformBrightness == Brightness.dark ? 'dark' : 'light';
      _selectTheme(defaultTheme);
    }

    return Scaffold(
      appBar: SAppBar(null, context: context, titleText: 'Tema'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildThemeOption('Tema claro', 'light', Icons.light_mode_outlined),
              _buildThemeOption('Tema escuro', 'dark', Icons.dark_mode_outlined),
              _buildThemeOption('Tema do dispositivo', 'system', Icons.phone_android_rounded),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeOption(String label, String themeValue, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () => _selectTheme(themeValue),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: TColors.buttonBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 20, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(label, style: const TextStyle(color: Colors.white)),
                  ],
                ),
                Radio<String>(
                  value: themeValue,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    _selectTheme(value!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

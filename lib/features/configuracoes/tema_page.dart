import 'package:flutter/material.dart';

import '../../core/design/widgets/s_app_bar.dart';

class TemaPage extends StatefulWidget {
  const TemaPage({super.key});

  @override
  State<TemaPage> createState() => _TemaPageState();
}

class _TemaPageState extends State<TemaPage> {
  String? selectedTheme; // Armazena qual tema está selecionado

  void _selectTheme(String theme) {
    setState(() {
      selectedTheme = theme; // Atualiza o tema selecionado
    });

    // Aqui você pode adicionar a lógica para mudar o tema do aplicativo
    // Por exemplo:
    // if (theme == 'light') {
    //   // Mudar para tema claro
    // } else if (theme == 'dark') {
    //   // Mudar para tema escuro
    // } else {
    //   // Mudar para tema do dispositivo
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(null, context: context, titleText: 'Tema'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () => _selectTheme('light'), // Seleciona tema claro
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.light_mode_outlined, size: 20),
                              const SizedBox(width: 10),
                              const Text('Tema claro'),
                            ],
                          ),
                          if (selectedTheme == 'light') // Exibe bolinha se selecionado
                            const Icon(Icons.circle, size: 12, color: Colors.blue),
                          const Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () => _selectTheme('dark'), // Seleciona tema escuro
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.dark_mode_outlined, size: 20),
                              const SizedBox(width: 10),
                              const Text('Tema escuro'),
                            ],
                          ),
                          if (selectedTheme == 'dark') // Exibe bolinha se selecionado
                            const Icon(Icons.circle, size: 12, color: Colors.blue),
                          const Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () => _selectTheme('system'), // Seleciona tema do dispositivo
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone_android_rounded, size: 20),
                              const SizedBox(width: 10),
                              const Text('Tema do dispositivo'),
                            ],
                          ),
                          if (selectedTheme == 'system') // Exibe bolinha se selecionado
                            const Icon(Icons.circle, size: 12, color: Colors.blue),
                          const Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

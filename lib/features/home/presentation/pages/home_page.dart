import 'package:campus_connect/features/home/presentation/widget/home_page_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/design/widgets/s_bottom_navigation_bar.dart';
import '../../../configuracoes/configuracoes_page.dart';
import '../../../mensagens/presentation/pages/mensagem_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.selectedIndex = 1});

  final int selectedIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final bool _isSpecialColor = false;

  late List<Widget> _widgetOptions;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _widgetOptions = <Widget>[
          const MensagemPage(),
          const HomePageWidget(),
          const ConfiguracoesPage(),
        ];
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      rethrow;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _widgetOptions.isNotEmpty
          ? _widgetOptions[_selectedIndex]
          : const Center(child: Text('Nenhum conteúdo disponível')),
      bottomNavigationBar: _isLoading
          ? null
          : SBottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 30),
            label: 'Mensagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: 'Configurações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        onTap: _onItemTapped,
        preenchido: _isSpecialColor,
      ),
    );
  }
}



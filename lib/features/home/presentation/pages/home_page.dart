import 'package:campus_connect/core/design/widgets/loading_widget.dart';
import 'package:campus_connect/features/mensagens/presentation/controllers/mensagem_controller.dart';
import 'package:campus_connect/features/mensagens/presentation/pages/mensagem_page.dart';
import 'package:campus_connect/features/mensagens/presentation/pages/mensagens_favoritas_page.dart';
import 'package:campus_connect/features/mensagens/presentation/pages/mensagens_lidas_page.dart';
import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design/themes/colors.dart';
import '../../../../core/design/widgets/drawer_widget.dart';
import '../../../mensagens/presentation/pages/todas_mensagens_page.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final UsuarioController _usuarioController = GetIt.I.get<UsuarioController>();
  final MensagemController _controller = GetIt.I.get<MensagemController>();

  late Future<void> _loadDataFuture;
  late int indexAll = 0;
  late int indexNotRead = 0;
  late int indexRead = 0;
  late int indexFavorite = 0;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  Future<void> _loadData() async {
    await _usuarioController.getUser();
    await _loadMensagem();
    setState(() {});
  }

  Future<void> _loadMensagem() async {
    await _controller.indexMensagens(_usuarioController.usuario!.id!);
    setState(() {
      indexAll = _controller.index!.data!.total!;
      indexNotRead = _controller.index!.data!.notReads!;
      indexRead = _controller.index!.data!.reads!;
      indexFavorite = _controller.index!.data!.favorites!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      drawer: const DrawerWidget(),
      body: FutureBuilder<void>(
        future: _loadDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoadingWidget(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Ocorreu um erro. Tente novamente mais tarde.'),
            );
          } else {
            return RefreshIndicator(
              onRefresh: _loadData,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(child: _buildContent()),
                ),
              ),
            );
          }
        },
      ),
    );
  }


  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Olá!!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(50),
            image: _usuarioController.usuario?.profilePhoto?.url != null
                ? DecorationImage(
              image: NetworkImage(
                _usuarioController.usuario!.profilePhoto!.url!,
              ),
              fit: BoxFit.cover,
            )
                : null,
          ),
          child: _usuarioController.usuario?.profilePhoto?.url == null
              ? const Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          )
              : null,
        ),
        const SizedBox(height: 20),
        Text(
          _usuarioController.usuario!.name!,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 2),
        Text(
          _usuarioController.usuario!.course!.name!,
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 30),
        _buildGrid(),
      ],
    );
  }

  Widget _buildGrid() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.45,
      child: GridView.count(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Widget>[
          _buildGridItem('Todas as mensagens', indexAll, const TodasMensagensPage()),
          _buildGridItem('Mensagens não lidas', indexNotRead, const MensagemPage()),
          _buildGridItem('Favoritas', indexFavorite, const MensagensFavoritasPage()),
          _buildGridItem('Mensagens lidas', indexRead, const MensagensLidasPage()),
        ],
      ),
    );
  }

  Widget _buildGridItem(String label, int count, Widget page) {
    return GestureDetector(
      onTap: () {
        Get.to(page);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 50,
        decoration: BoxDecoration(
          color: TColors.buttonBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

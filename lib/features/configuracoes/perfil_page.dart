import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:campus_connect/core/services/file_entity.dart';
import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/design/themes/colors.dart';
import '../../core/design/widgets/s_app_bar.dart';
import '../../core/services/anexo_model.dart';
import '../../core/utils/sizes.dart';
import '../home/presentation/pages/home_page.dart';
import '../usuarios/data/models/atualizar_usuario_model.dart';
import '../usuarios/data/models/response_data_user_model.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  UsuarioController usuarioController = GetIt.I<UsuarioController>();
  String? selectedCurso;
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  File? _selectedImage;
  bool isLoading = false;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    usuarioController.getListCourses();
    _nome.text = usuarioController.usuario!.name!;
    _telefone.text = usuarioController.usuario!.phone!;
    _email.text = usuarioController.usuario!.email!;
    selectedCurso = usuarioController.usuario!.course!.id!.toString();
  }

  Future<void> _openImagePicker() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Câmera'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeria'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _alterar() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, selecione uma imagem antes de salvar.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final imageBytes = await _selectedImage!.readAsBytes();

      AnexoModel anexo = AnexoModel(file: imageBytes);

      FileEntity? respostaAnexo = await usuarioController.envioAnexo(anexo);

      if (respostaAnexo != null) {
        ProfilePhoto profilePhoto = ProfilePhoto(
            id: respostaAnexo.id,
            name: respostaAnexo.name,
            type: respostaAnexo.type,
            url: respostaAnexo.url,
            size: respostaAnexo.size);

        final AtualizarUsuarioModel atualizarModel = AtualizarUsuarioModel(
          id: usuarioController.usuario!.id,
          name: _nome.text,
          email: _email.text,
          phone: _telefone.text,
          idCurso: selectedCurso,
          profilePhoto: profilePhoto,
        );

        if (usuarioController.usuario?.profilePhoto?.url == null) {
          await usuarioController.atualizar(atualizarModel);
        } else {
          await usuarioController.updateAnexo(
              anexo, usuarioController.usuario!.profilePhoto!.id!);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePageWidget(),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Alterações salvas com sucesso!'),
            backgroundColor: Colors.black,
          ),
        );
      } else {
        throw Exception('Falha ao enviar a imagem.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao salvar alterações'),
          backgroundColor: Colors.black,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(context: context, titleText: 'Perfil'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _openImagePicker,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(60),
                      image: _selectedImage != null
                          ? DecorationImage(
                              image: FileImage(_selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : (usuarioController.usuario?.profilePhoto?.url !=
                                  null
                              ? DecorationImage(
                                  image: NetworkImage(usuarioController
                                      .usuario!.profilePhoto!.url!),
                                  fit: BoxFit.cover,
                                )
                              : null),
                    ),
                    child: _selectedImage == null &&
                            usuarioController.usuario?.profilePhoto?.url == null
                        ? const Center(
                            child: Icon(Icons.file_upload_outlined,
                                color: Colors.black, size: 40))
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(child: Text('Foto do perfil')),
              Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      const Text(
                        'Nome completo',
                        style: TextStyle(fontSize: TSizes.fontSizeSm),
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: _nome,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItens,
                      ),
                      const Text(
                        'Telefone',
                        style: TextStyle(fontSize: TSizes.fontSizeSm),
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: _telefone,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItens,
                      ),
                      const Text(
                        'Email universitário',
                        style: TextStyle(fontSize: TSizes.fontSizeSm),
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: _email,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItens,
                      ),
                      const Text(
                        'Curso',
                        style: TextStyle(fontSize: TSizes.fontSizeSm),
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Observer(
                        builder: (_) {
                          if (usuarioController.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final courseGroups =
                              usuarioController.cursos?.data ?? [];
                          final Map<String, List<Map<String, String>>>
                              cursosMap = {};

                          // Mapeando ID e nome de cada curso
                          for (var group in courseGroups) {
                            cursosMap[group.name ?? ''] =
                                group.courses?.map((course) {
                                      return {
                                        'id': course.id.toString(),
                                        // Supondo que 'id' seja a propriedade que armazena o ID do curso
                                        'name': course.name ?? ''
                                      };
                                    }).toList() ??
                                    [];
                          }

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCurso,
                                hint: const Text('    Escolha uma opção'),
                                isExpanded: true,
                                dropdownColor: Colors.white,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCurso = newValue;
                                  });
                                },
                                items: cursosMap.entries
                                    .expand((entry) => [
                                          DropdownMenuItem<String>(
                                            enabled: false,
                                            child: Text(
                                              entry.key,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          ...entry.value.map(
                                            (curso) => DropdownMenuItem<String>(
                                              value: curso['id'],
                                              // ID do curso como valor
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0),
                                                child: Text(
                                                  curso['name']!,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ])
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      const Text(
                        '*Ao selecionar outro curso, você deixará de acompanhar as notificações deste canal.',
                        style: TextStyle(fontSize: TSizes.fontSizesms),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItens,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: GestureDetector(
                          onTap: () async {
                            _alterar();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: TColors.buttonBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          TColors.buttonBackground),
                                    ),
                                  )
                                : const Text(
                                    'Salvar alterações',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

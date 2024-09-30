import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design/themes/colors.dart';
import '../../../../core/utils/image_strings.dart';
import '../../../../core/utils/sizes.dart';
import '../../../../core/utils/spacing_styles.dart';
import '../../data/models/response_list_courses_model.dart';

class EscolherCursoPage extends StatefulWidget {
  const EscolherCursoPage({super.key});

  @override
  State<EscolherCursoPage> createState() => _EscolherCursoPageState();
}

class _EscolherCursoPageState extends State<EscolherCursoPage> {
  String? selectedCurso;
  final UsuarioController controller = GetIt.I<UsuarioController>();

  @override
  void initState() {
    super.initState();
    controller.getListTypeDano(); // Atualize o método para obter a lista de cursos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width * 0.7,
                    image: const AssetImage(
                      TImages.escolherCursoImage,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.defaultSpace,
                  ),
                  const Text('Selecione seu curso', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) {
                      if (controller.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final courseGroups = controller.cursos?.data ?? [];

                      final Map<String, List<String>> cursosMap = {};

                      for (var group in courseGroups) {
                        cursosMap[group.name ?? ''] = group.courses?.map((course) => course.name ?? '').toList() ?? [];
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
                            hint: const Text('Escolha um curso'),
                            isExpanded: true,
                            dropdownColor: Colors.white,
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
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              ...entry.value.map(
                                    (curso) => DropdownMenuItem<String>(
                                  value: curso,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(curso),
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
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação do botão
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(side: BorderSide.none),
                      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : TColors.darkBackground,
                      padding: EdgeInsets.all(16),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).brightness == Brightness.dark ? TColors.darkBackground : Colors.white,
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

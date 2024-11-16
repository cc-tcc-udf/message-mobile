import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TDeviceUtils {
  //Oculta o teclado para o BuildContext especificado
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //Define a cor da barra de status
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  //Ativa ou desativa o modo de tela cheia
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  //Retorna a altura da tela do dispositivo
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  //Retorna a largura da tela do dispositivo
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //Retorna a taxa de pixels do dispositivo
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  //Retorna a altura da barra de status
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  //Verifica se o teclado está visível
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  //Esconde a barra de status do sistema
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  //Exibe a barra de status do sistema
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  //Verifica se há uma conexão com a internet. Retorna true se houver conexão e false caso contrário
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  //Coloca um ... para textos grandes
  static String truncateWithEllipsis(int cutoff, String text) {
    return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}...';
  }
}

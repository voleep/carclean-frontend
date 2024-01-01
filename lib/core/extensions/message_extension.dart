import 'package:flutter/material.dart';

extension MessageExtension on ScaffoldMessengerState {
  void showSaveSuccessMessage() => showMessage('Salvo com sucesso!');

  void showMessage(String message) => showSnackBar(
        SnackBar(content: Text(message)),
      );
}

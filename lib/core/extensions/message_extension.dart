import 'package:flutter/material.dart';

extension MessageExtension on ScaffoldMessengerState {
  void showSaveSuccessMessage() => showSnackBar(
        const SnackBar(content: Text('Salvo com sucesso!')),
      );
}

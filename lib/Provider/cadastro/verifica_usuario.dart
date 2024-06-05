import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetoepi/Constrain/url.dart';

class UsuarioCadastrado extends ChangeNotifier {
  bool _valido = false;
  String? _msgError;

  bool get valido => _valido;
  String get msgError => _msgError!;

  //válida campo

  final String baseUrl = '${AppUrl.baseUrl}/api/Usuario/Check';

  Future checarUsuario(String cpf, String email) async {
    try {
      cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');
      
      final response =
          await http.get(Uri.parse('$baseUrl?Cpf=$cpf&Email=$email'));
      _msgError = '';
      String resposta = '';
      resposta = response.body;

      if (response.statusCode == 200) {
        _valido = true;
        _msgError = resposta;
        notifyListeners();
        return _valido;
      }

      if (response.statusCode == 400) {
        _msgError = resposta;
        notifyListeners();
        return _valido;
      }
    } catch (e) {
      _msgError = 'Erro: $e';
      notifyListeners();
      return _valido;
    }
  }
}

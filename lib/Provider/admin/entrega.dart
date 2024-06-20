import 'package:flutter/material.dart';
import 'package:projetoepi/Services/entregaapi.dart';

class EntregaProvider with ChangeNotifier {
  final ApiServiceEntrega apiService = ApiServiceEntrega();

  List<dynamic> colaboradores = [];
  List<dynamic> epis = [];
  int? selectedColaborador;
  String? nomeColaborador;
  int? selectedEpi;
  String? dataValidade;
  String? dataEntrega;
  bool carregando = false;

  Future<void> fetchColaboradores() async {
    carregando = true;
    colaboradores = await apiService.fetchColaboradores();
    carregando = false;
    notifyListeners();
  }

  Future<void> fetchEpis() async {
    carregando = true;
    epis = await apiService.fetchEpis();
    carregando = false;
    notifyListeners();
  }

  Future<void> criarEntrega() async {
    if (selectedColaborador != null &&
        selectedEpi != null &&
        dataValidade != null &&
        dataEntrega != null) {
    carregando = true;
     carregando = true;
      await apiService.cadastrar(
          selectedColaborador!, selectedEpi!, dataValidade!, dataEntrega!);
      carregando = false;
      notifyListeners();
    }

  
  }

  void setSelectedColaborador(int idCol, String nome) {
    nomeColaborador = nome;
    selectedColaborador = idCol;
    notifyListeners();
  }

  void setSelectedEpi(int idEpi) {
    selectedEpi = idEpi;
    notifyListeners();
  }

  void setDataValidade(String validade) {
    dataValidade = validade;
    notifyListeners();
  }

  void setDataEntrega(String entrega) {
    dataEntrega = entrega;
    notifyListeners();
  }
}

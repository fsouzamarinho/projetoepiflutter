import 'dart:convert';
import 'dart:js';
import 'package:intl/intl.dart';
import 'package:projetoepi/Constrain/url.dart';
import 'package:projetoepi/Utils/mensage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiServiceEntrega {
  Future<List<dynamic>> fetchEpis() async {
    var dados = await SharedPreferences.getInstance();
    String? token = dados.getString("token");

    final response =
        await http.get(Uri.parse('${AppUrl.baseUrl}api/Epi'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar EPIs');
    }
  }

  Future<List<dynamic>> fetchColaboradores() async {
    var dados = await SharedPreferences.getInstance();
    String? token = dados.getString("token");

    final response =
        await http.get(Uri.parse('${AppUrl.baseUrl}api/Colaborador'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar Colaboradores');
    }
  }

  Future<void> cadastrar(
    int idEpi,
    int idCol,
    String dataValidade,
    String dataEntrega,
  ) async {
    var dados = await SharedPreferences.getInstance();
    String? token = dados.getString("token");

    String url = '${AppUrl.baseUrl}api/Epi';

    //converter data válidade
    DateFormat formatBrasil = DateFormat("dd/MM/yyyy");
    DateTime dataBrParse = formatBrasil.parse(dataValidade);

    DateFormat formatAmericano = DateFormat("yyyy-MM-dd");
    String dataAmericanaV = formatAmericano.format(dataBrParse);

    //converter data entrega
    DateTime dataBrParse2 = formatBrasil.parse(dataEntrega);

    DateFormat formatAmericano2 = DateFormat("yyyy-MM-dd");
    String dataAmericanaE = formatAmericano2.format(dataBrParse2);

    Map<String, dynamic> requestBody = {
      "dataValidade": dataAmericanaV,
      "dateEntrega": dataAmericanaE,
      "idEpi": idEpi,
      "idCol": idCol
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );
    
    if (response.statusCode == 200) {
  
    } else {
      print("nok");
      throw Exception('Falha ao criar Entrega');
    }
    print(response.body);
  }
}

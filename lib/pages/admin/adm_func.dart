import 'package:flutter/material.dart';
import 'package:projetoepi/Widget/field.dart';

class AdmFunc extends StatefulWidget {
  const AdmFunc ({super.key});

  @override
  State<AdmFunc > createState() => _AdmFuncState();
}

class _AdmFuncState extends State<AdmFunc > {
  final TextEditingController _nome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Administrativo'),
        ),
        body: Center(
          child: Column(
            children: [
              customTextField(
                  title: 'Nome do Funcionário',
                  controller: _nome,
                  hint: 'Digite o nome do Funcionário',
                  tipo: TextInputType.text),
            ],
          ),
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:projetoepi/Widget/field.dart';

class AdminEpi extends StatefulWidget {
  const AdminEpi({super.key});

  @override
  State<AdminEpi> createState() => _AdminEpiState();
}

class _AdminEpiState extends State<AdminEpi> {
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
                  title: 'Nomedo epi',
                  controller: _nome,
                  hint: 'Digite o nome do Epi',
                  tipo: TextInputType.text),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:projetoepi/Widget/field.dart';

class AdmEntrega extends StatefulWidget {
  const AdmEntrega({super.key});

  @override
  State<AdmEntrega> createState() => _AdmEntregaState();
}

class _AdmEntregaState extends State<AdmEntrega> {

  final TextEditingController _data = TextEditingController();
  

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
                title: 'Email',
                controller: _data,
                hint: 'Data da entrega',
                tipo: TextInputType.datetime),
            ],
          ),
        ));
  }
}

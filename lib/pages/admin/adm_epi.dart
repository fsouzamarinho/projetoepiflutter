import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/admin/cadepi.dart';
import 'package:projetoepi/Utils/mensage.dart';
import 'package:projetoepi/Widget/botao.dart';
import 'package:projetoepi/Widget/field.dart';
import 'package:provider/provider.dart';

class AdminEpi extends StatefulWidget {
  const AdminEpi({super.key});

  @override
  State<AdminEpi> createState() => _AdminEpiState();
}

class _AdminEpiState extends State<AdminEpi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
   final TextEditingController _instrucoes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<CadEpiProvider>(builder: (context, epiprovider, _){
      return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Administrativo'),
          ),
          body: Center(
            child: Column(
              children: [
                customTextField(
                    title: 'Nome',
                    controller: _nome,
                    hint: 'Digite o nome do Epi',
                    tipo: TextInputType.text),

                    customTextField(
                    title: 'Nomedo epi',
                    controller: _instrucoes,
                    hint: 'Digite o nome do Epi',
                    tipo: TextInputType.text),

                    customButton(
                        tap: () {
                          if (_formKey.currentState!.validate()) {
                            epiprovider.cadastrar(
                              context,
                              _nome.text,
                              _instrucoes.text,
                            
                            );
                          } else {    
                            showMessage(
                                message:
                                    "Todos os campos devem ser preenchidos",
                                context: context);
                          }
                        },
                        text: "Concluir",
                        context: context,
                        status: epiprovider.carregando)
              ],
            ),
          )),
    );
    });
  }
}

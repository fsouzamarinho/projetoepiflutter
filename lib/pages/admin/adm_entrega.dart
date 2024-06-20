import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/admin/entrega.dart';
import 'package:provider/provider.dart';

class AdmEntrega extends StatefulWidget {
  const AdmEntrega({super.key});

  @override
  State<AdmEntrega> createState() => _AdmEntregaState();
}

class _AdmEntregaState extends State<AdmEntrega> {
  @override
  void initState() {
    Provider.of<EntregaProvider>(context, listen: false).fetchColaboradores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cadastrar Entrega - Escolha o Colaborador')),
      body: Consumer<EntregaProvider>(
        builder: (context, dataProvider, _) {
          if (dataProvider.carregando == true) {
            return const Center(child: CircularProgressIndicator());
          } else {}
          return ListView.builder(
            itemCount: dataProvider.colaboradores.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dataProvider.colaboradores[index]['nomeCol']),
                subtitle: Text(dataProvider.colaboradores[index]['email']),
                onTap: () {
                  dataProvider.setSelectedColaborador(
                      dataProvider.colaboradores[index]['idCol'],
                      dataProvider.colaboradores[index]['nomeCol']);
                  Navigator.pushNamed(context, '/episentrega');
                },
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projetoepi/Style/colors.dart';
import 'package:projetoepi/Utils/mensage.dart';
import 'package:projetoepi/Provider/cadastro/create_user.dart';
import 'package:provider/provider.dart';

class ConfirmPassword extends StatelessWidget {
  final String email;
  final String cpf;

  const ConfirmPassword({super.key, required this.email, required this.cpf});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Consumer<ValidarSenha>(builder: (context, validarsenha, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Confirme a Senha'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bem-Vindo $cpf'),
              Container(
                decoration: BoxDecoration(
                  color: green,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('A senha deve conter:'),
                    Text('8 caracteres'),
                    Text('Uma Letra Maíscula'),
                    Text('Um número'),
                    Text('Um Caracter Especial'),
                  ],
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                onChanged: (value) {
                  validarsenha.validatePassword(value);
                },
              ),
              if (validarsenha.msgError.isNotEmpty)
                Text(
                  validarsenha.msgError,
                  style: const TextStyle(color: Colors.red),
                ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    showMessage(
                        message: "As senhas devem ser iguais",
                        context: context);
                  } else {
                    var cpfint = cpf.replaceAll(RegExp(r'[^0-9]'), '');
                    validarsenha.createUser(
                        email, passwordController.text, int.parse(cpfint));
                    showMessage(
                        message: validarsenha.msgErrorApi, context: context);
                  }
                },
                child: const Text('Concluir'),
              ),
            ],
          ),
        ),
      );
    });
  }
}

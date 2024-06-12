import 'package:flutter/material.dart';
import 'package:projetoepi/Utils/mensage.dart';
import 'package:projetoepi/Provider/cadastro/create_user.dart';
import 'package:projetoepi/Widget/botao.dart';
import 'package:provider/provider.dart';

class ConfirmPassword extends StatefulWidget {
  final String email;
  final String cpf;

  const ConfirmPassword({super.key, required this.email, required this.cpf});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    dispose() {
      passwordController.clear();
      confirmPasswordController.clear();
      super.dispose();
    }

    return Consumer<ValidarSenha>(builder: (context, validarsenha, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Confirme a Senha'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Bem-Vindo'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
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
              customButton(
                  tap: () async {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      showMessage(
                          message: "As senhas devem ser iguais",
                          context: context);
                    } else {
                      var cpfint = widget.cpf.replaceAll(RegExp(r'[^0-9]'), '');
                      await validarsenha.createUser(widget.email,
                          passwordController.text, int.parse(cpfint));
                      showMessage(
                          // ignore: use_build_context_synchronously
                          message: validarsenha.msgErrorApi,
                          // ignore: use_build_context_synchronously
                          context: context);
                    }
                  },
                  text: "Concluir",
                  context: context,
                  status: validarsenha.carregando)
            ],
          ),
        ),
      );
    });
  }
}

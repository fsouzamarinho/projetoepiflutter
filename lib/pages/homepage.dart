import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/login/logar.dart';
import 'package:projetoepi/Utils/mensage.dart';
import 'package:projetoepi/Widget/botao.dart';
import 'package:projetoepi/Widget/field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Logar>(builder: (context, logar, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("SafeGuard"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          color: const Color(0xff5DADE2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextField(
                  title: 'Email',
                  controller: _email,
                  hint: 'Digite seu e-mail',
                  tipo: TextInputType.emailAddress),
              customTextField(
                  title: 'Senha',
                  controller: _password,
                  hint: 'Digite sua senha',
                  tipo: TextInputType.visiblePassword,
                  funcao: (value) {
                    logar.validatePassword(value);
                  }),
              if (logar.msgError.isNotEmpty)
                Text(
                  logar.msgError,
                  style: const TextStyle(color: Colors.red),
                ),
              customButton(
                  text: 'Login',
                  tap: () async {
                    if (_email.text.isEmpty || _password.text.isEmpty) {
                      showMessage(
                          message: "Todos os campos são requiridos",
                          context: context);
                    } else {
                      await logar.logarUsuario(_email.text, _password.text, 0);
                      if (logar.logado) {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushNamed('/dashboard');
                      } else {
                        showMessage(
                            message: "Usuário ou senha inválidos",
                            // ignore: use_build_context_synchronously
                            context: context);
                      }
                    }
                  },
                  context: context,
                  status: logar.carregando),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cadastro');
                },
                child: const Text('Cadastre-se Agora'),
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/cadastro/create_user.dart';
import 'package:projetoepi/Provider/cadastro/verifica_usuario.dart';
import 'package:projetoepi/Provider/login/logar.dart';
import 'package:projetoepi/pages/dashboard.dart';
import 'package:projetoepi/pages/homepage.dart';
import 'package:projetoepi/pages/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ValidarSenha()),
        ChangeNotifierProvider(create: (_) => UsuarioCadastrado()),
        ChangeNotifierProvider(create: (_) => Logar()),
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (context) => const HomePage(),
          '/cadastro': (context) => const SignupScreen(),
          '/dashboard': (context) => const Dashboard()
        },
        debugShowCheckedModeBanner: false,
      )));
}

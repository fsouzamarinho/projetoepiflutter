import 'package:flutter/material.dart';
import 'package:projetoepi/Pages/admin/adm_entrega.dart';
import 'package:projetoepi/Pages/admin/adm_epi.dart';
import 'package:projetoepi/Pages/admin/adm_func.dart';
import 'package:projetoepi/Pages/admin/entrega/dataentrega.dart';
import 'package:projetoepi/Pages/admin/entrega/escolheepi.dart';
import 'package:projetoepi/Provider/admin/cadepi.dart';
import 'package:projetoepi/Provider/admin/colaborador.dart';
import 'package:projetoepi/Provider/admin/entrega.dart';
import 'package:projetoepi/Provider/cadastro/create_user.dart';
import 'package:projetoepi/Provider/cadastro/verifica_usuario.dart';
import 'package:projetoepi/Provider/login/logar.dart';
import 'package:projetoepi/Pages/admin/admin.dart';
import 'package:projetoepi/Pages/dashboard.dart';
import 'package:projetoepi/Pages/homepage.dart';
import 'package:projetoepi/Pages/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ValidarSenha()),
        ChangeNotifierProvider(create: (_) => UsuarioCadastrado()),
        ChangeNotifierProvider(create: (_) => Logar()),
        ChangeNotifierProvider(create: (_) => ColaboradorProvider()),
        ChangeNotifierProvider(create: (_) => CadEpiProvider()),
        ChangeNotifierProvider(create: (_) => EntregaProvider()),
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (context) => const HomePage(),
          '/cadastro': (context) => const SignupScreen(),
          '/dashboard': (context) => const Dashboard(),
          '/admin': (context) => const Admin(),
          '/admentrega': (context) => const AdmEntrega(),
          '/admepi': (context) => const AdminEpi(),
          '/admfunc': (context) => const AdmFunc(),
          '/episentrega': (context) => const EpisScreen(),
          '/entrega': (context) => EntregaScreen(),
        },
        debugShowCheckedModeBanner: false,
      )));
}

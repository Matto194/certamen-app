import 'package:cer_ojeda_ramirez/pages/form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio de Sesión'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: (LoginForm()),
        ));
  }
}

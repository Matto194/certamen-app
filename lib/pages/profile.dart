import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String usuario;

  const Profile({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido $usuario'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/images/${this.usuario}.webp',
              width: 70, // Ancho de la imagen
              height: 70, // Alto de la imagen
            ),
          ),
        ],
        //leading: Padding(
        //  padding: EdgeInsets.all(2),
        //  child: Image.asset('assets/images/$usuario.webp'),
        //),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

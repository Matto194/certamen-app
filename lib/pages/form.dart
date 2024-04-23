import 'package:cer_ojeda_ramirez/pages/profile.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final List listaAsesinos = ['Shinobi', 'Adjudicator', 'Harbinger'];

  @override
  Widget build(BuildContext context) {
    String? _selectedUser;
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButtonFormField(
              items: listaAsesinos.map((nombre) {
                return DropdownMenuItem(
                  child: Text(nombre),
                  value: nombre,
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Usuario'),
              onChanged: (value) {
                _selectedUser = value as String?;
                print(value);
              }),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'contraseña'),
          ),
          SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                if (_selectedUser != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(usuario: _selectedUser!),
                    ),
                  );
                }
              },
              child: Text('Iniciar sesión'))
        ],
      ),
    );
  }
}

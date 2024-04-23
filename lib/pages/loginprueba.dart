import 'package:flutter/material.dart';

class LoginPagePrueba extends StatelessWidget {
  final List<String> usuarios;

  const LoginPagePrueba({Key? key, required this.usuarios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _selectedUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: Text('Selecciona un usuario'),
              value: _selectedUser,
              onChanged: (String? newValue) {
                _selectedUser = newValue;
                print('Usuario seleccionado: $_selectedUser');
              },
              items: usuarios.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                if (_selectedUser != null) {
                  // Aquí puedes agregar la lógica para continuar con el inicio de sesión
                  print('Iniciar sesión con usuario: $_selectedUser');
                } else {
                  print('Por favor selecciona un usuario');
                }
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

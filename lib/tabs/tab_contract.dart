import 'package:flutter/material.dart';

// Clase para representar un contrato
class Contract {
  final String state;
  final double amount;
  final String type;
  final String targetPerson;
  final String imagePath; // Cambia la propiedad a imagePath

  Contract({
    required this.state,
    required this.amount,
    required this.type,
    required this.targetPerson,
    required this.imagePath, // Inicializa la propiedad imagePath
  });
}

class TabContract extends StatefulWidget {
  const TabContract({super.key});

  @override
  _TabContractState createState() => _TabContractState();
}

class _TabContractState extends State<TabContract> {
  // Define una lista de contratos mutable con datos ficticios.
  var _contracts = <Contract>[
    Contract(
      state: 'Abierto',
      amount: 2000000,
      type: 'Asesinato',
      targetPerson: 'John Wick',
      imagePath: 'assets/images/john-wick.jpg', // Cambia a la ruta local de la imagen
    ),
    Contract(
      state: 'Cerrado',
      amount: 90000,
      type: 'Protección',
      targetPerson: 'Iosef Tarasov',
      imagePath: 'assets/images/Iosef_Tarasov.jpg', // Cambia a la ruta local de la imagen
    ),
    // Agrega más contratos según sea necesario.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView.builder(
        itemCount: _contracts.length,
        itemBuilder: (context, index) {
          final contract = _contracts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(contract.imagePath), // Usa AssetImage para cargar imágenes locales
                  radius: 30, // Ajusta el tamaño del círculo
                ),
                title: Text(
                  'Persona Objetivo: ${contract.targetPerson}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estado: ${contract.state}',
                      style: TextStyle(
                        color: contract.state == 'Abierto' ? Colors.green : Colors.red,
                      ),
                    ),
                    Text(
                      'Monto: \$${contract.amount.toStringAsFixed(0)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Tipo: ${contract.type}'),
                  ],
                ),
                isThreeLine: true,
              ),
            ),
          );
        },
      ),
    );
  }
}

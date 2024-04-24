import 'package:flutter/material.dart';

// Clase para representar un hotel Continental
class Hotel {
  final String name;
  final String location;
  final int numRooms;
  final String imagePath; // Propiedad para la ruta de la imagen

  Hotel({
    required this.name,
    required this.location,
    required this.numRooms,
    required this.imagePath, // Inicializa la propiedad imagePath
  });
}

class TabHotel extends StatefulWidget {
  const TabHotel({super.key});

  @override
  _TabHotelState createState() => _TabHotelState();
}

class _TabHotelState extends State<TabHotel> {
  // Define una lista de hoteles Continental mutable con datos ficticios.
  var _hotels = <Hotel>[
    Hotel(
      name: 'Continental de Nueva York',
      location: 'Nueva York, Estados Unidos',
      numRooms: 200,
      imagePath: 'assets/images/continental-ny.jpg', // Ruta local de la imagen
    ),
    Hotel(
      name: 'Continental de Casablanca',
      location: 'Casablanca, Marruecos',
      numRooms: 150,
      imagePath: 'assets/images/continental-casablanca.jpg', // Ruta local de la imagen
    ),
    // Agrega más hoteles según sea necesario.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          final hotel = _hotels[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(hotel.imagePath), // Usa AssetImage para cargar imágenes locales
                  radius: 30, // Ajusta el tamaño del círculo
                ),
                title: Text(
                  hotel.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ubicación: ${hotel.location}'),
                    Text('Número de habitaciones: ${hotel.numRooms}'),
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

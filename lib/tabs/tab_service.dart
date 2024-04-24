import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Service {
  final String name;
  final String description;
  final String location;
  final String hours;
  final IconData icon;

  Service({
    required this.name,
    required this.description,
    required this.location,
    required this.hours,
    required this.icon,
  });
}

class TabService extends StatelessWidget {
  // Define una lista de servicios disponibles.
  final List<Service> services = [
    Service(
      name: 'Sommelier',
      description: 'Proporciona armas y munición.',
      location: 'Continental Hotel',
      hours: '24/7',
      icon: MdiIcons.pistol,
    ),
    Service(
      name: 'Doctor',
      description: 'Servicio médico de urgencia.',
      location: 'Continental Hotel',
      hours: '24/7',
      icon: MdiIcons.medicalBag,
    ),
    Service(
      name: 'Sastre',
      description: 'Proporciona trajes con resistencia a balas.',
      location: 'Continental Hotel',
      hours: '9 AM - 5 PM',
      icon: MdiIcons.tie,
    ),
    Service(
      name: 'Limpiadores',
      description: 'Encargados del aseo de lugares donde hubo asesinatos y de “gestionar” los cadáveres.',
      location: 'Continental Hotel',
      hours: '24/7',
      icon: MdiIcons.broom,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de columnas en la cuadrícula
          childAspectRatio: 1.0, // Relación de aspecto de cada bloque
          crossAxisSpacing: 10, // Espacio entre columnas
          mainAxisSpacing: 10, // Espacio entre filas
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return GestureDetector(
            onTap: () {
              // Navegar a la pantalla de detalles del servicio
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetailScreen(service: service),
                ),
              );
            },
            child: Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    service.icon,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    service.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Pantalla de detalles del servicio
class ServiceDetailScreen extends StatelessWidget {
  final Service service;

  const ServiceDetailScreen({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Descripción: ${service.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Ubicación: ${service.location}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Horario: ${service.hours}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

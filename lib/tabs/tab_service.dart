import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Service {
    final String name;
    final String personCharge;
    final String description;
    final String location;
    final String hours;
    final IconData icon;
    final String image;

    Service({
        required this.name,
        required this.personCharge,
        required this.description,
        required this.location,
        required this.hours,
        required this.icon,
        required this.image
    });
}

class TabService extends StatelessWidget {
    final List<Service> services = [
        Service(
            name: 'Sommelier',
            personCharge: 'Desconocido',
            description: 'Proporciona armas y munición.',
            location: 'Continental Hotel',
            hours: '24/7',
            icon: MdiIcons.pistol,
            image: 'assets/images/sommelier.png'
        ),
        Service(
            name: 'Doctor',
            personCharge: 'Desconocido',
            description: 'Servicio médico de urgencia.',
            location: 'Continental Hotel',
            hours: '24/7',
            icon: MdiIcons.medicalBag,
            image: 'assets/images/doctor.png'
        ),
        Service(
            name: 'Sastre',
            personCharge: 'Desconocido',
            description: 'Proporciona trajes con resistencia a balas.',
            location: 'Continental Hotel',
            hours: '9 AM - 5 PM',
            icon: MdiIcons.tie,
            image: 'assets/images/sastre.png'
        ),
        Service(
            name: 'Limpiadores',
            personCharge: 'Charlie',
            description: 'Encargados del aseo de lugares donde hubo asesinatos y de “gestionar” los cadáveres.',
            location: 'Continental Hotel',
            hours: '24/7',
            icon: MdiIcons.broom,
            image: 'assets/images/limpieza.png'
        ),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 41, 25, 85), 
            body: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10, 
                    mainAxisSpacing: 10, 
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                    final service = services[index];
                    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceDetailScreen(service: service),
                            ),
                        ),
                        child: Card(
                            color: Color.fromARGB(202, 255, 255, 255), // Color de fondo del card
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Icon(
                                        service.icon,
                                        size: 40,
                                        color: Color(0xFF4A7DDF), // Color de los iconos
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                        service.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF7B10A1), // Color del texto
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

class ServiceDetailScreen extends StatelessWidget {
    final Service service;

    const ServiceDetailScreen({required this.service});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 27, 27, 27),
            appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 54, 18, 87),
                iconTheme: IconThemeData(color: Color(0xFF7B10A1)),
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Centraliza el contenido
                    children: [
                        Text(
                            service.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xFF7B10A1),
                            ),
                            textAlign: TextAlign.center, // Centra el texto
                        ),
                        SizedBox(height: 10),
                        // Utiliza la ruta de la imagen almacenada en service.imagePath
                        Image.asset(
                            service.image,
                            width: 200,
                            height: 200,
                        ),
                        SizedBox(height: 20),
                        // Detalles del servicio justificados y ordenados
                        Text('Encargado: ${service.personCharge}',
                          style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                            ),
                            textAlign: TextAlign.center, ),
                        SizedBox(height: 10,),
                        Text(
                            'Descripción: ${service.description}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                            ),
                            textAlign: TextAlign.center, // Justifica el texto
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Ubicación: ${service.location}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                            ),
                            textAlign: TextAlign.center, // Justifica el texto
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Horario: ${service.hours}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                            ),
                            textAlign: TextAlign.center, // Justifica el texto
                        ),
                    ],
                ),
            ),
        );
    }
}


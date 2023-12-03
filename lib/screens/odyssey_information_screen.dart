import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:configuracion_loggin/providers/btd6_provider.dart';

class OdysseyInformationScreen extends StatelessWidget {
  const OdysseyInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Odyssey Information'),
      ),
      body: FutureBuilder(
        future: Provider.of<Btd6Provider>(context, listen: false).getPowers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return OdysseyDetails();
          }
        },
      ),
    );
  }
}

class OdysseyDetails extends StatelessWidget {
  const OdysseyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final odyssey = Provider.of<Btd6Provider>(context).odyssey;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Odyssey Details',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          if (odyssey != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${odyssey.id ?? "N/A"}', style: TextStyle(fontSize: 18.0)),
                Text('Extreme Mode: ${odyssey.isExtreme ?? false}',
                
                    style: TextStyle(fontSize: 18.0)),
                // Otros detalles con el operador de nulabilidad (?)
                // Ejemplo:
                 Text('Max Monkey Seats: ${odyssey.maxMonkeySeats ?? "N/A"}', style: TextStyle(fontSize: 18.0)),
                 Text('Max Monkeys On Boat: ${odyssey.maxMonkeysOnBoat ?? "N/A"}', style: TextStyle(fontSize: 18.0)),
                // ...
            Text('AvailablePowers: ${odyssey.availablePowers ?? "N/A"}', style: TextStyle(fontSize: 18.0)),
             Text('AvailableTowers: ${odyssey.availableTowers ?? "N/A"}', style: TextStyle(fontSize: 18.0)),
             


                // Agrega más detalles según sea necesario
              ],
            ),
          if (odyssey == null)
            Text('No se encontraron datos de la odisea.'),
        ],
      ),
    );
  }
}

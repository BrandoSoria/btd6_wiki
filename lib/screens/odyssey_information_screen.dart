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
                Text(
                    'indicador de vidas inicial: ${odyssey.startingHealth ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),
                Text('premios: ${odyssey.rewards ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),

                Text(
                    'indicador de vidas inicial: ${odyssey.startingHealth ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),

                Text('ID: ${odyssey.id ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),
                Text('Extremo S/N: ${odyssey.isExtreme ?? false}',
                    style: TextStyle(fontSize: 18.0)),
                // Otros detalles con el operador de nulabilidad (?)
                // Ejemplo:
                Text(
                    'asientos maximo por cada mono : ${odyssey.maxMonkeySeats ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),
                Text(
                    'maximo de monos en el barco: ${odyssey.maxMonkeysOnBoat ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),
                // ...
                Text(
                    'Poderes disponibles y cantidad: ${odyssey.availablePowers ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),
                Text(
                    'torres disponibles, heroes, mejoras y cantidad: ${odyssey.availableTowers ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),

                // Agrega más detalles según sea necesario
              ],
            ),
          if (odyssey == null) Text('No se encontraron datos de la odisea.'),
        ],
      ),
    );
  }
}

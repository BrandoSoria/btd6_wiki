import 'package:configuracion_loggin/models/models.dart';
import 'package:flutter/material.dart';

class OdysseyDetails extends StatelessWidget {
  final Body odyssey;

  OdysseyDetails({required this.odyssey});

  @override
  Widget build(BuildContext context) {
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
                color: Colors.blue),
          ),
          SizedBox(height: 10.0),
          Text('ID: ${odyssey.id}', style: TextStyle(fontSize: 18.0)),
          Text('Extreme Mode: ${odyssey.isExtreme}',
              style: TextStyle(fontSize: 18.0)),
          // Agrega más detalles según sea necesario

          // Mostrar las listas de AvailablePowers, AvailableTowers, DefaultPowers, DefaultTowers, Rewards, etc.
          buildListSection('Available Powers', odyssey.availablePowers),
          buildListSection('Available Towers', odyssey.availableTowers),
          buildListSection('Default Powers', odyssey.defaultPowers),
          buildListSection('Default Towers', odyssey.defaultTowers),
          buildListSection('Rewards', odyssey.rewards),

          // Mostrar el mapa
          Text('Maps: ${odyssey.maps}', style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }

  Widget buildListSection(String title, List<dynamic> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Text(title,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange)),
        SizedBox(height: 5.0),
        for (var item in items)
          Text('- $item', style: TextStyle(fontSize: 16.0)),
      ],
    );
  }
}

//aqui mostrare los datos que arroja mi api
Body getSampleOdyssey() {
  return Body(
    id: 'lpko5tzn',
    isExtreme: true,
    maxMonkeySeats: 4,
    maxMonkeysOnBoat: 2,
    maxPowerSlots: 3,
    startingHealth: 100,
    rewards: ['Reward 1', 'Reward 2', 'Reward 3'],
    availablePowers: [
      AvailablePower(power: 'Power 1', max: 3),
      AvailablePower(power: 'Power 2', max: 5),
    ],
    availableTowers: [
      AvailableTower(
          tower: 'Tower 1',
          max: 2,
          path1NumBlockedTiers: 1,
          path2NumBlockedTiers: 0,
          path3NumBlockedTiers: 2,
          isHero: false),
      AvailableTower(
          tower: 'Tower 2',
          max: 1,
          path1NumBlockedTiers: 0,
          path2NumBlockedTiers: 1,
          path3NumBlockedTiers: 0,
          isHero: true),
    ],
    defaultPowers: [DefaultOwer(name: 'Default Power 1', quantity: 1)],
    defaultTowers: [DefaultOwer(name: 'Default Tower 1', quantity: 2)],
    maps: 'Map 1, Map 2',
  );
}

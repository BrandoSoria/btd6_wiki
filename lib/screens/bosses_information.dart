import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:configuracion_loggin/providers/btd6_provider.dart';

class BossesInformationScreen extends StatelessWidget {
  const BossesInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bosses Information'),
      ),
      body: FutureBuilder(
        future: Provider.of<Btd6Provider>(context, listen: false).getBosses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return BossDetails();
          }
        },
      ),
    );
  }
}

class BossDetails extends StatelessWidget {
  const BossDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boss = Provider.of<Btd6Provider>(context).boss;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Boss Details',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          if (boss != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${boss.id ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),
                Text('Name: ${boss.name ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),
                Text('Type: ${boss.bossType ?? "N/A"}',
                    style: TextStyle(fontSize: 18.0)),
                // Agrega más detalles según sea necesario

                // Mostrar la imagen del jefe (si está disponible)
                if (boss.bossTypeUrl != null)
                  Image.network(
                    boss.bossTypeUrl,
                    height: 150.0,
                    width: double.infinity, // Ajustar al ancho del contenedor
                    fit: BoxFit
                        .fitWidth, // Ajustar al ancho sin distorsionar la proporción
                  ),
              ],
            ),
          if (boss == null) Text('No se encontraron datos del jefe.'),
        ],
      ),
    );
  }
}

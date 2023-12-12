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
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, 'favoritebosses');
            },
          ),
        ],
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
    final btd6Provider = Provider.of<Btd6Provider>(context);
    final bosses = btd6Provider.bosses;
    final favoriteBosses = btd6Provider.favoriteBosses;

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
          if (bosses != null && bosses.isNotEmpty)
            for (var boss in bosses)
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
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  SizedBox(height: 16.0),

                  // Botón de corazón para agregar/quitar de favoritos
                  IconButton(
                    icon: Icon(
                      favoriteBosses?.contains(boss) == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (favoriteBosses?.contains(boss) == true) {
                        btd6Provider.removeFromFavorites(boss);
                      } else {
                        btd6Provider.addToFavorites(boss);
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
          if (bosses == null || bosses.isEmpty)
            Text('No se encontraron datos de los jefes.'),
        ],
      ),
    );
  }
}

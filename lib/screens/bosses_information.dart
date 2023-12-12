import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:configuracion_loggin/providers/btd6_provider.dart';

class BossesInformationScreen extends StatelessWidget {
  const BossesInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bosses Information',
          style: TextStyle(
            fontFamily: 'Rubik Microbe',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 252, 252),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
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
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.red)));
          } else {
            return BossDetails();
          }
        },
      ),
      backgroundColor: Colors.blue[100],
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
          const Text(
            'Bosses Information',
            style: TextStyle(
              fontFamily: 'Rubik Microbe',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 28, 198, 204),
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
                    Container(
                      height: 100.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 8,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          boss.bossTypeUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  SizedBox(height: 16.0),

                  // Botón de corazón para agregar/quitar de favoritos
                  GestureDetector(
                    onTap: () {
                      if (favoriteBosses?.contains(boss) == true) {
                        btd6Provider.removeFromFavorites(boss);
                      } else {
                        btd6Provider.addToFavorites(boss);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        favoriteBosses?.contains(boss) == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
          if (bosses == null || bosses.isEmpty)
            Text('No se encontraron datos de los jefes.',
                style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

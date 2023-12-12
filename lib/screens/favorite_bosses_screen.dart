import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:configuracion_loggin/providers/btd6_provider.dart';

class FavoriteBossesScreen extends StatelessWidget {
  const FavoriteBossesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteBosses = Provider.of<Btd6Provider>(context).favoriteBosses;

    return Scaffold(
     appBar: AppBar(
        title: const Text(
          'Favorite Bosses',
          style: TextStyle(
            fontFamily: 'Rubik Microbe',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 252, 252),
           
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteBosses?.length ?? 0,
        itemBuilder: (context, index) {
          final boss = favoriteBosses![index];
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                boss.name ?? 'N/A',
                style: TextStyle(
                  fontFamily: 'Rubik Microbe',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              leading: boss.bossTypeUrl != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(boss.bossTypeUrl!),
                    )
                  : const Icon(Icons.image_not_supported),
              // Agrega más detalles según sea necesario
            ),
          );
        },
      ),
      backgroundColor: Colors.blue[100], // Color de fondo de la pantalla
    );
  }
}

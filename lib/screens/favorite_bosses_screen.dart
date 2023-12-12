import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:configuracion_loggin/providers/btd6_provider.dart';

class FavoriteBossesScreen extends StatelessWidget {
  const FavoriteBossesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteBosses =
        Provider.of<Btd6Provider>(context).favoriteBosses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Bosses'),
      ),
      body: ListView.builder(
        itemCount: favoriteBosses?.length ?? 0,
        itemBuilder: (context, index) {
          final boss = favoriteBosses![index];
          return ListTile(
            title: Text(boss.name ?? 'N/A'),
            leading: boss.bossTypeUrl != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(boss.bossTypeUrl!),
                  )
                : const Icon(Icons.image_not_supported),
            // Agrega más detalles según sea necesario
          );
        },
      ),
    );
  }
}

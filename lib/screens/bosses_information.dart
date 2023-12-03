// bosses_information.dart

import 'package:flutter/material.dart';

class BossesInformationScreen extends StatelessWidget {
  const BossesInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bosses Information'),
      ),
      body: Center(
        child: const Text('This is the Bosses Information Screen'),
      ),
    );
  }
}

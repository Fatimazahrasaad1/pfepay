import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import de Provider
import 'package:mkadia/provider/userProvider.dart'; // Import du UserProvider
import 'package:mkadia/views/profil/profil.dart'; // Import de la page de profil

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Utilisation de `super.key`

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Mon Application',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const ProfilPage(), // Suppression du `const` ici car ProfilPage peut avoir des dépendances
      ),
    );
  }
}
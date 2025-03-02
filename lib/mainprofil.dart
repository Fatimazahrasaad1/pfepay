import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import de Provider
import 'package:mkadia/provider/userProvider.dart'; // Import du UserProvider
import 'package:mkadia/provider/adresseProvider.dart'; // Import du AdresseProvider
import 'package:mkadia/views/profil/profil.dart'; // Import de la page de profil

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Utilisation de `super.key`

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AdresseProvider()), // Ajout du provider manquant
      ],
      child: MaterialApp(
        title: 'Mon Application',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const ProfilPage(), // Garde `const` si ProfilPage n'a pas de dépendance dynamique
      ),
    );
  }
}

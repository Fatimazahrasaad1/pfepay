import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import de Provider
import 'package:mkadia/provider/userProvider.dart'; // Import du UserProvider
import 'package:mkadia/views/profil/profil.dart'; // Import de la page de profil
import 'package:mkadia/views/home/HomeView.dart'; // Assurez-vous que HomeView est correct

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
        home: HomeView(), // Suppression du `const`
        routes: {
          '/profil': (context) => ProfilPage(), // Suppression du `const`
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mkadia/models/user.dart'; // Assurez-vous d'importer le fichier user.dart
import 'package:mkadia/views/profil/profil.dart'; // Assurez-vous que ProfilPage est bien défini

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProfilPage(user: users[0]), // Passez le premier utilisateur de la liste users
    );
  }
}

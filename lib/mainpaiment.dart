import 'package:flutter/material.dart';
import 'package:mkadia/views/parametre/paiementsave.dart'; // Importez PaymentSavePage
import 'package:mkadia/provider/PaymentManager.dart'; // Importez PaymentManager

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(), // Page d'accueil
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Créez une instance de PaymentManager
            final paymentManager = PaymentManager();

            // Naviguez vers PaymentSavePage en passant paymentManager
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentSavePage(
                  paymentManager: paymentManager, // Passez l'instance ici
                ),
              ),
            );
          },
          child: Text('Aller à la page de paiement'),
        ),
      ),
    );
  }
}
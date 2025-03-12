import 'package:flutter/material.dart';
import 'package:mkadia/provider/PaymentManager.dart';
import 'package:mkadia/views/paiement/paiement.dart';
import 'package:mkadia/views/parametre/paiementsave.dart';

void main() {
  runApp(MyApp()); // Point d'entrée de l'application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.green, // Thème principal
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final paymentManager = PaymentManager();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSavePage(paymentManager: paymentManager),
                  ),
                );
              },
              child: Text('Aller à la page de paiement'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final paymentManager = PaymentManager();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(paymentManager: paymentManager),
                  ),
                );
              },
              child: Text('Aller à la page PaymentPage'),
            ),
          ],
        ),
      ),
    );
  }
}
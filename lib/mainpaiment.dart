import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mkadia/provider/PaymentManager.dart'; // Importez PaymentManager
import 'package:mkadia/views/paiement/paiement.dart'; // Importez PaymentPage
import 'package:mkadia/views/parametre/paiementsave.dart'; // Importez PaymentSavePage

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentManager()), // Fournir PaymentManager
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(), // Page d'accueil avec les boutons
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bouton pour naviguer vers la page de paiement
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(), // Page de paiement
                  ),
                );
              },
              child: Text('Page de Paiement'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20), // Espace entre les boutons
            // Bouton pour naviguer vers la page de sauvegarde des méthodes de paiement
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSavePage(
                      paymentManager: Provider.of<PaymentManager>(context, listen: false), // Passer PaymentManager
                    ),
                  ),
                );
              },
              child: Text('Sauvegarder Méthode de Paiement'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
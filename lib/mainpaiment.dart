import 'package:flutter/material.dart';
import 'package:mkadia/provider/PaymentManager.dart';
import 'package:mkadia/views/parametre/paiementsave.dart';
import 'package:mkadia/views/paiement/paiement.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PaymentManager paymentManager = PaymentManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(paymentManager: paymentManager),
    );
  }
}

class HomePage extends StatelessWidget {
  final PaymentManager paymentManager;
  HomePage({required this.paymentManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accueil'), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaymentPage(paymentManager: paymentManager)),
                );
              },
              child: Text('Aller à la page Paiement'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaymentSavePage(paymentManager: paymentManager)),
                );
              },
              child: Text('Aller à la page Enregistrement Paiement'),
            ),
          ],
        ),
      ),
    );
  }
}

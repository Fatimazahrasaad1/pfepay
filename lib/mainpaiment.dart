import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mkadia/provider/provider_payment.dart'; // Assurez-vous que ce chemin est correct
import 'package:mkadia/views/paiement/paiement.dart'; // Assurez-vous que ce chemin est correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentProvider(),
      child: MaterialApp(
        title: 'Paiement',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: PaymentPage(),
      ),
    );
  }
}

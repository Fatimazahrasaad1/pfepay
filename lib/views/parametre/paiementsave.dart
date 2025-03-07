import 'package:flutter/material.dart';
import 'package:mkadia/provider/PaymentManager.dart';

class PaymentSavePage extends StatelessWidget {
  final PaymentManager paymentManager;
  PaymentSavePage({required this.paymentManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Méthodes de Paiement'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPaymentOption(context, 'Credit Card'),
            SizedBox(height: 10),
            _buildPaymentOption(context, 'PayPal'),
            SizedBox(height: 10),
            _buildPaymentOption(context, 'Apple Pay'),
            SizedBox(height: 10),
            _buildPaymentOption(context, 'Google Pay'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ajouter la logique d'enregistrement ici
              },
              child: Text('Enregistrer'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(BuildContext context, String method) {
    return GestureDetector(
      onTap: () {
        paymentManager.setPaymentMethod(method);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            method,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

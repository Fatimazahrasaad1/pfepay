import 'package:flutter/material.dart';
import 'package:mkadia/provider/PaymentManager.dart';

class PaymentPage extends StatefulWidget {
  final PaymentManager paymentManager;
  PaymentPage({required this.paymentManager});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paiement'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Adresse de Livraison', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('${widget.paymentManager.paymentInfo.address}, '
                    '${widget.paymentManager.paymentInfo.city}, ${widget.paymentManager.paymentInfo.country}'),
              ),
            ),
            SizedBox(height: 16),
            Text('Méthode de Paiement', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: widget.paymentManager.selectedPaymentMethod,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    widget.paymentManager.setPaymentMethod(newValue);
                  });
                }
              },
              items: ['Carte de Crédit', 'PayPal', 'Apple Pay', 'Google Pay'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Ajouter votre logique de paiement ici
              },
              child: Text('Confirmer et Payer'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

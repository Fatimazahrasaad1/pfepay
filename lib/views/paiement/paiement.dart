import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mkadia/provider/PaymentManager.dart'; // Import du gestionnaire de paiement

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentManager = Provider.of<PaymentManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Paiement'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Affichage de l'adresse de livraison
            Text(
              'Adresse de Livraison',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '${paymentManager.paymentInfo.address}, ${paymentManager.paymentInfo.city}, ${paymentManager.paymentInfo.country}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 16),

            // Sélection de la méthode de paiement
            Text(
              'Méthode de Paiement',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButton<String>(
                  value: paymentManager.selectedPaymentMethod,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      paymentManager.setPaymentMethod(newValue);
                    }
                  },
                  items: <String>['Carte de Crédit', 'PayPal', 'Apple Pay', 'Google Pay']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Formulaire spécifique à chaque méthode de paiement
            if (paymentManager.selectedPaymentMethod == 'Carte de Crédit') ...[
              _buildCreditCardForm(paymentManager),
            ] else if (paymentManager.selectedPaymentMethod == 'PayPal') ...[
              _buildPayPalForm(paymentManager),
            ] else if (paymentManager.selectedPaymentMethod == 'Apple Pay') ...[
              _buildApplePayForm(paymentManager),
            ] else if (paymentManager.selectedPaymentMethod == 'Google Pay') ...[
              _buildGooglePayForm(paymentManager),
            ],

            SizedBox(height: 16),

            // Bouton de confirmation de paiement
            ElevatedButton(
              onPressed: () {
                // Ajouter votre logique de confirmation ici
                paymentManager.savePaymentInfo();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // couleur du bouton
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Confirmer et Payer', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  // Formulaire pour Carte de Crédit
  Widget _buildCreditCardForm(PaymentManager paymentManager) {
    return Column(
      children: [
        TextFormField(
          initialValue: paymentManager.paymentInfo.name,
          decoration: InputDecoration(labelText: 'Nom sur la carte'),
          onChanged: (value) => paymentManager.paymentInfo.name = value,
        ),
        TextFormField(
          initialValue: paymentManager.paymentInfo.cardNumber,
          decoration: InputDecoration(labelText: 'Numéro de carte'),
          keyboardType: TextInputType.number,
          onChanged: (value) => paymentManager.paymentInfo.cardNumber = value,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: paymentManager.paymentInfo.expiryDate,
                decoration: InputDecoration(labelText: 'Date d\'expiration'),
                onChanged: (value) => paymentManager.paymentInfo.expiryDate = value,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                initialValue: paymentManager.paymentInfo.cvv,
                decoration: InputDecoration(labelText: 'CVV'),
                obscureText: true,
                onChanged: (value) => paymentManager.paymentInfo.cvv = value,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Formulaire pour PayPal
  Widget _buildPayPalForm(PaymentManager paymentManager) {
    return Column(
      children: [
        TextFormField(
          initialValue: paymentManager.paymentInfo.paypalEmail,
          decoration: InputDecoration(labelText: 'E-mail PayPal'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => paymentManager.paymentInfo.paypalEmail = value,
        ),
      ],
    );
  }

  // Formulaire pour Apple Pay
  Widget _buildApplePayForm(PaymentManager paymentManager) {
    return Column(
      children: [
        TextFormField(
          initialValue: paymentManager.paymentInfo.applePayID,
          decoration: InputDecoration(labelText: 'Apple Pay ID'),
          keyboardType: TextInputType.text,
          onChanged: (value) => paymentManager.paymentInfo.applePayID = value,
        ),
      ],
    );
  }

  // Formulaire pour Google Pay
  Widget _buildGooglePayForm(PaymentManager paymentManager) {
    return Column(
      children: [
        TextFormField(
          initialValue: paymentManager.paymentInfo.googlePayID,
          decoration: InputDecoration(labelText: 'Google Pay ID'),
          keyboardType: TextInputType.text,
          onChanged: (value) => paymentManager.paymentInfo.googlePayID = value,
        ),
      ],
    );
  }
}

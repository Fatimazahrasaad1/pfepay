import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mkadia/provider/provider_payment.dart'; // Assurez-vous d'importer le provider

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

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
                  '${paymentProvider.paymentInfo.address}, ${paymentProvider.paymentInfo.city}, ${paymentProvider.paymentInfo.country}',
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
                  value: paymentProvider.selectedPaymentMethod,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      paymentProvider.setSelectedPaymentMethod(newValue);
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
            if (paymentProvider.selectedPaymentMethod == 'Carte de Crédit') ...[
              _buildCreditCardForm(paymentProvider),
            ] else if (paymentProvider.selectedPaymentMethod == 'PayPal') ...[
              _buildPayPalForm(paymentProvider),
            ] else if (paymentProvider.selectedPaymentMethod == 'Apple Pay') ...[
              _buildApplePayForm(paymentProvider),
            ] else if (paymentProvider.selectedPaymentMethod == 'Google Pay') ...[
              _buildGooglePayForm(paymentProvider),
            ],

            SizedBox(height: 16),

            // Bouton de confirmation de paiement
            ElevatedButton(
              onPressed: () {
                // Ajouter votre logique de confirmation ici
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
  Widget _buildCreditCardForm(PaymentProvider paymentProvider) {
    return Column(
      children: [
        TextFormField(
          initialValue: paymentProvider.paymentInfo.name,
          decoration: InputDecoration(labelText: 'Nom sur la carte'),
          onChanged: (value) => paymentProvider.paymentInfo.name = value,
        ),
        TextFormField(
          initialValue: paymentProvider.paymentInfo.cardNumber,
          decoration: InputDecoration(labelText: 'Numéro de carte'),
          keyboardType: TextInputType.number,
          onChanged: (value) => paymentProvider.paymentInfo.cardNumber = value,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: paymentProvider.paymentInfo.expiryDate,
                decoration: InputDecoration(labelText: 'Date d\'expiration'),
                onChanged: (value) => paymentProvider.paymentInfo.expiryDate = value,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                initialValue: paymentProvider.paymentInfo.cvv,
                decoration: InputDecoration(labelText: 'CVV'),
                obscureText: true,
                onChanged: (value) => paymentProvider.paymentInfo.cvv = value,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Formulaire pour PayPal
  Widget _buildPayPalForm(PaymentProvider paymentProvider) {
    return Column(
      children: [
        TextFormField(
          initialValue: paymentProvider.paymentInfo.paypalEmail,
          decoration: InputDecoration(labelText: 'E-mail PayPal'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => paymentProvider.paymentInfo.paypalEmail = value,
        ),
      ],
    );
  }

  // Formulaire pour Apple Pay
  Widget _buildApplePayForm(PaymentProvider paymentProvider) {
    return Column(
      children: [
        TextFormField(
          initialValue: paymentProvider.paymentInfo.applePayID,
          decoration: InputDecoration(labelText: 'Apple Pay ID'),
          keyboardType: TextInputType.text,
          onChanged: (value) => paymentProvider.paymentInfo.applePayID = value,
        ),
      ],
    );
  }

  // Formulaire pour Google Pay
  Widget _buildGooglePayForm(PaymentProvider paymentProvider) {
    return Column(
      children: [
        TextFormField(
          initialValue: paymentProvider.paymentInfo.googlePayID,
          decoration: InputDecoration(labelText: 'Google Pay ID'),
          keyboardType: TextInputType.text,
          onChanged: (value) => paymentProvider.paymentInfo.googlePayID = value,
        ),
      ],
    );
  }
}

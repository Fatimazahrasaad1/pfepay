import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mkadia/provider/prov_savepaiement.dart'; // Import du provider

class PaymentSavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Méthodes de Paiement'),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.green[50],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildPaymentOption(context, 'Credit Card', 'assets/icons/creditcard.png'),
              SizedBox(height: 10),
              _buildPaymentOption(context, 'PayPal', 'assets/icons/paypal.png'),
              SizedBox(height: 10),
              _buildPaymentOption(context, 'Apple Pay', 'assets/icons/apple-pay.png'),
              SizedBox(height: 10),
              _buildPaymentOption(context, 'Google Pay', 'assets/icons/google-pay.png'),
              SizedBox(height: 20),
              Consumer<PaymentProvider>(
                builder: (context, provider, child) => _buildPaymentFields(provider),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<PaymentProvider>(context, listen: false)
                      .savePaymentInfo(context);
                },
                child: Text('Enregistrer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentFields(PaymentProvider provider) {
    switch (provider.selectedPayment) {
      case 'Credit Card':
        return Column(
          children: [
            _buildTextField('Numéro de carte', provider.cardNumberController),
            _buildTextField('Date d\'expiration (MM/AA)', provider.expiryDateController),
            _buildTextField('CVV', provider.cvvController, obscureText: true),
          ],
        );
      case 'PayPal':
        return _buildTextField('E-mail PayPal', provider.paypalEmailController);
      case 'Apple Pay':
      case 'Google Pay':
        return Column(
          children: [
            _buildTextField('Numéro de téléphone', provider.phoneNumberController),
            _buildTextField('Adresse', provider.addressController),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildPaymentOption(BuildContext context, String method, String iconPath) {
    return GestureDetector(
      onTap: () {
        Provider.of<PaymentProvider>(context, listen: false).setPaymentMethod(method);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.asset(iconPath, height: 40),
              SizedBox(width: 20),
              Text(
                method,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

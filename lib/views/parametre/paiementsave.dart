import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mkadia/provider/PaymentManager.dart';

class PaymentSavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentManager(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Méthodes de Paiement'),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.green[50],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildPaymentOption(context, 'Credit Card', 'assets/icons/creditcard.png'),
              const SizedBox(height: 10),
              _buildPaymentOption(context, 'PayPal', 'assets/icons/paypal.png'),
              const SizedBox(height: 10),
              _buildPaymentOption(context, 'Apple Pay', 'assets/icons/apple-pay.png'),
              const SizedBox(height: 10),
              _buildPaymentOption(context, 'Google Pay', 'assets/icons/google-pay.png'),
              const SizedBox(height: 20),
              Consumer<PaymentManager>(
                builder: (context, manager, child) => _buildPaymentFields(manager),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<PaymentManager>(context, listen: false).savePaymentInfo(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentFields(PaymentManager manager) {
    switch (manager.selectedPaymentMethod) {
      case 'Credit Card':
        return Column(
          children: [
            _buildTextField('Numéro de carte', manager.paymentInfo.cardNumber, (value) {
              manager.updatePaymentInfo(manager.paymentInfo.copyWith(cardNumber: value));
            }),
            _buildTextField('Date d\'expiration (MM/AA)', manager.paymentInfo.expiryDate, (value) {
              manager.updatePaymentInfo(manager.paymentInfo.copyWith(expiryDate: value));
            }),
            _buildTextField('CVV', manager.paymentInfo.cvv, (value) {
              manager.updatePaymentInfo(manager.paymentInfo.copyWith(cvv: value));
            }, obscureText: true),
          ],
        );
      case 'PayPal':
        return _buildTextField('E-mail PayPal', manager.paymentInfo.paypalEmail ?? '', (value) {
          manager.updatePaymentInfo(manager.paymentInfo.copyWith(paypalEmail: value));
        });
      case 'Apple Pay':
      case 'Google Pay':
        return Column(
          children: [
            _buildTextField('Numéro de téléphone', manager.paymentInfo.applePayID ?? '', (value) {
              manager.updatePaymentInfo(manager.paymentInfo.copyWith(applePayID: value));
            }),
            _buildTextField('Adresse', manager.paymentInfo.address, (value) {
              manager.updatePaymentInfo(manager.paymentInfo.copyWith(address: value));
            }),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildPaymentOption(BuildContext context, String method, String iconPath) {
    return GestureDetector(
      onTap: () {
        Provider.of<PaymentManager>(context, listen: false).setSelectedPaymentMethod(method);
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
              const SizedBox(width: 20),
              Text(
                method,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value, Function(String) onChanged, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: value),
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PaymentSavePage extends StatefulWidget {
  @override
  _PaymentSavePageState createState() => _PaymentSavePageState();
}

class _PaymentSavePageState extends State<PaymentSavePage> {
  String _selectedPayment = 'Credit Card';
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _paypalEmailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _savePaymentInfo() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Informations enregistrées avec succès !')),
    );
  }

  Widget _buildPaymentFields() {
    switch (_selectedPayment) {
      case 'Credit Card':
        return Column(
          children: [
            _buildTextField('Numéro de carte', _cardNumberController),
            _buildTextField('Date d\'expiration (MM/AA)', _expiryDateController),
            _buildTextField('CVV', _cvvController, obscureText: true),
          ],
        );
      case 'PayPal':
        return _buildTextField('E-mail PayPal', _paypalEmailController);
      case 'Apple Pay':
      case 'Google Pay':
        return Column(
          children: [
            _buildTextField('Numéro de téléphone', _phoneNumberController),
            _buildTextField('Adresse', _addressController),
          ],
        );
      default:
        return Container();
    }
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

  Widget _buildPaymentOption(String method, String iconPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPayment = method;
        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Méthodes de Paiement'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPaymentOption('Credit Card', 'assets/icons/creditcard.png'),
            SizedBox(height: 10),
            _buildPaymentOption('PayPal', 'assets/icons/paypal.png'),
            SizedBox(height: 10),
            _buildPaymentOption('Apple Pay', 'assets/icons/apple-pay.png'),
            SizedBox(height: 10),
            _buildPaymentOption('Google Pay', 'assets/icons/google-pay.png'),
            SizedBox(height: 20),
            _buildPaymentFields(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePaymentInfo,
              child: Text('Enregistrer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

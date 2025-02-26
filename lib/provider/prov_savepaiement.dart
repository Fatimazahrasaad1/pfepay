import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  String _selectedPayment = 'Credit Card';

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController paypalEmailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String get selectedPayment => _selectedPayment;

  void setPaymentMethod(String method) {
    _selectedPayment = method;
    notifyListeners();
  }

  void savePaymentInfo(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Informations enregistrées avec succès !')),
    );
  }
}

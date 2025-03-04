import 'package:flutter/material.dart';
import 'package:mkadia/models/info_paiement.dart'; // Assurez-vous que ce modèle est correctement défini

class PaymentProvider with ChangeNotifier {
  PaymentInfo _paymentInfo = PaymentInfo.examplePayments()[0]; // Initialisation avec un exemple
  String _selectedPaymentMethod = 'Carte de Crédit';

  // Getter pour récupérer les informations de paiement
  PaymentInfo get paymentInfo => _paymentInfo;

  // Getter pour récupérer la méthode de paiement sélectionnée
  String get selectedPaymentMethod => _selectedPaymentMethod;

  // Setter sécurisé pour mettre à jour les informations de paiement
  void setPaymentInfo(PaymentInfo newPaymentInfo) {
    _paymentInfo = newPaymentInfo;
    notifyListeners();
  }

  // Setter sécurisé pour mettre à jour la méthode de paiement
  void setSelectedPaymentMethod(String method) {
    if (_selectedPaymentMethod != method) {
      _selectedPaymentMethod = method;
      notifyListeners();
    }
  }

  // Mise à jour sécurisée des informations de paiement individuelles
  void updatePaymentInfo({String? name, String? cardNumber, String? expiryDate, String? cvv, String? paypalEmail, String? applePayID, String? googlePayID}) {
    _paymentInfo = PaymentInfo(
      name: name ?? _paymentInfo.name,
      cardNumber: cardNumber ?? _paymentInfo.cardNumber,
      expiryDate: expiryDate ?? _paymentInfo.expiryDate,
      cvv: cvv ?? _paymentInfo.cvv,
      paypalEmail: paypalEmail ?? _paymentInfo.paypalEmail,
      applePayID: applePayID ?? _paymentInfo.applePayID,
      googlePayID: googlePayID ?? _paymentInfo.googlePayID,
      address: _paymentInfo.address,
      city: _paymentInfo.city,
      country: _paymentInfo.country,
    );
    notifyListeners();
  }

  // Méthode de réinitialisation des paiements
  void resetPayment() {
    _paymentInfo = PaymentInfo.examplePayments()[0];
    _selectedPaymentMethod = 'Carte de Crédit';
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:mkadia/models/info_paiement.dart'; // Assurez-vous que vous importez le modèle PaymentInfo

class PaymentProvider with ChangeNotifier {
  PaymentInfo _paymentInfo = PaymentInfo.examplePayments()[0]; // Initialisation avec un exemple

  String _selectedPaymentMethod = 'Carte de Crédit';

  // Getter pour récupérer les informations de paiement
  PaymentInfo get paymentInfo => _paymentInfo;

  // Getter pour récupérer la méthode de paiement sélectionnée
  String get selectedPaymentMethod => _selectedPaymentMethod;

  // Setter pour mettre à jour les informations de paiement
  void setPaymentInfo(PaymentInfo newPaymentInfo) {
    _paymentInfo = newPaymentInfo;
    notifyListeners(); // Notifie les écouteurs pour mettre à jour l'UI
  }

  // Setter pour mettre à jour la méthode de paiement
  void setSelectedPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }

  // Méthode de réinitialisation
  void resetPayment() {
    _paymentInfo = PaymentInfo.examplePayments()[0]; // Réinitialisation avec l'exemple
    _selectedPaymentMethod = 'Carte de Crédit'; // Réinitialisation à la carte par défaut
    notifyListeners();
  }
}

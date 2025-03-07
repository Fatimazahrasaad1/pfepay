import 'package:mkadia/models/info_paiement.dart';

class PaymentManager {
  PaymentInfo paymentInfo = PaymentInfo(
    cardNumber: '',
    expiryDate: '',
    cvv: '',
    name: '',
    address: '',
    city: '',
    country: '',
  );

  String selectedPaymentMethod = 'Carte de Crédit';

  void setPaymentMethod(String method) {
    selectedPaymentMethod = method;
  }

  void updatePaymentInfo(PaymentInfo newInfo) {
    paymentInfo = newInfo;
  }
}

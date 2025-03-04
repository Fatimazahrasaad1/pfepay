class PaymentInfo {
   String cardNumber;
   String expiryDate;
   String cvv;
   String name;
   String address;
   String city;
   String country;
   String? applePayID;
   String? googlePayID;
   String? paypalEmail;

  PaymentInfo({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.name,
    required this.address,
    required this.city,
    required this.country,
    this.applePayID,
    this.googlePayID,
    this.paypalEmail,
  });

  // Méthode pour obtenir des exemples de paiements
  static List<PaymentInfo> examplePayments() {
    return [
      PaymentInfo(
        cardNumber: '1234567812345678',
        expiryDate: '12/25',
        cvv: '123',
        name: 'John Doe',
        address: '123 Main Street',
        city: 'Paris',
        country: 'France',
        applePayID: 'john.doe@apple.com',
        googlePayID: 'johndoe@google.com',
        paypalEmail: 'john.doe@paypal.com',
      ),
      PaymentInfo(
        cardNumber: '8765432187654321',
        expiryDate: '06/24',
        cvv: '456',
        name: 'Jane Smith',
        address: '456 Elm Street',
        city: 'Lyon',
        country: 'France',
        applePayID: 'jane.smith@apple.com',
        googlePayID: 'janesmith@google.com',
        paypalEmail: 'jane.smith@paypal.com',
      ),
    ];
  }

  // Méthode copyWith pour modifier un champ sans recréer tout l'objet
  PaymentInfo copyWith({
    String? cardNumber,
    String? expiryDate,
    String? cvv,
    String? name,
    String? address,
    String? city,
    String? country,
    String? applePayID,
    String? googlePayID,
    String? paypalEmail,
  }) {
    return PaymentInfo(
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      applePayID: applePayID ?? this.applePayID,
      googlePayID: googlePayID ?? this.googlePayID,
      paypalEmail: paypalEmail ?? this.paypalEmail,
    );
  }
}

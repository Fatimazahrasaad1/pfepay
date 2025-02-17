import 'package:flutter/material.dart';

class UpdateAdressesLivraisonPage extends StatefulWidget {
  @override
  _UpdateAdressesLivraisonPageState createState() =>
      _UpdateAdressesLivraisonPageState();
}

class _UpdateAdressesLivraisonPageState
    extends State<UpdateAdressesLivraisonPage> {
  final _formKey = GlobalKey<FormState>();

  String _address = '';
  String _city = '';
  String _postalCode = '';

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialisation des champs avec des valeurs par défaut
    _addressController.text = _address;
    _cityController.text = _city;
    _postalCodeController.text = _postalCode;
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _address = _addressController.text;
        _city = _cityController.text;
        _postalCode = _postalCodeController.text;
      });

      // Affichage d'un message de confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Adresse de livraison mise à jour avec succès!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          'Modifier l\'adresse de livraison',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Champ pour l'adresse
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Adresse',
                  hintText: 'Entrez votre adresse de livraison',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.green, width: 1), // Bord visible
                  ),
                  prefixIcon: Icon(Icons.location_on, color: Colors.green),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une adresse';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Champ pour la ville
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Ville',
                  hintText: 'Entrez votre ville',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.green, width: 1), // Bord visible
                  ),
                  prefixIcon: Icon(Icons.location_city, color: Colors.green),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une ville';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Champ pour le code postal
              TextFormField(
                controller: _postalCodeController,
                decoration: InputDecoration(
                  labelText: 'Code Postal',
                  hintText: 'Entrez votre code postal',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.green, width: 1), // Bord visible
                  ),
                  prefixIcon: Icon(Icons.pin, color: Colors.green),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un code postal';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Bouton pour sauvegarder les informations aligné à droite et taille modérée
              Align(
                alignment: Alignment.centerRight, // Aligne le bouton à droite
                child: ElevatedButton(
                  onPressed: _saveAddress,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    child: Text(
                      'Sauvegarder',
                      style: TextStyle(
                        fontSize: 16, // Taille modérée du texte
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Remplacer 'primary' par 'backgroundColor'
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Forme arrondie du bouton
                    ),
                    elevation: 8,
                    minimumSize: Size(150, 50), // Taille modérée du bouton
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

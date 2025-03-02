import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mkadia/provider/adresseprovider.dart'; // Assurez-vous que l'import est correct

class UpdateAdressesLivraisonPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  UpdateAdressesLivraisonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdresseProvider>(
      builder: (context, adresseProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            title: const Text(
              'Modifier l\'adresse de livraison',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Champ Adresse
                    TextFormField(
                      controller: _addressController,
                      decoration: _inputDecoration('Adresse', Icons.location_on),
                      validator: (value) =>
                          value!.isEmpty ? 'Veuillez entrer une adresse' : null,
                    ),
                    const SizedBox(height: 20),

                    // Champ Ville
                    TextFormField(
                      controller: _cityController,
                      decoration: _inputDecoration('Ville', Icons.location_city),
                      validator: (value) =>
                          value!.isEmpty ? 'Veuillez entrer une ville' : null,
                    ),
                    const SizedBox(height: 20),

                    // Champ Code Postal
                    TextFormField(
                      controller: _postalCodeController,
                      decoration: _inputDecoration('Code Postal', Icons.pin),
                      validator: (value) =>
                          value!.isEmpty ? 'Veuillez entrer un code postal' : null,
                    ),
                    const SizedBox(height: 30),

                    // Bouton Sauvegarder
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            adresseProvider.updateAdresse(
                              _addressController.text,
                              _cityController.text,
                              _postalCodeController.text,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Adresse de livraison mise à jour avec succès!'),
                              ),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                          child: Text(
                            'Sauvegarder',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 8,
                          minimumSize: const Size(150, 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.green, width: 1),
      ),
      prefixIcon: Icon(icon, color: Colors.green),
    );
  }
}

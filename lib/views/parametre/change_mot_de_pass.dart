import 'package:flutter/material.dart';

class ChangeMotDePassePage extends StatefulWidget {
  @override
  _ChangeMotDePassePageState createState() => _ChangeMotDePassePageState();
}

class _ChangeMotDePassePageState extends State<ChangeMotDePassePage> {
  final _formKey = GlobalKey<FormState>();

  String _oldPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialisation des champs avec des valeurs par défaut
    _oldPasswordController.text = _oldPassword;
    _newPasswordController.text = _newPassword;
    _confirmPasswordController.text = _confirmPassword;
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _oldPassword = _oldPasswordController.text;
        _newPassword = _newPasswordController.text;
        _confirmPassword = _confirmPasswordController.text;
      });

      // Affichage d'un message de confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mot de passe mis à jour avec succès!')),
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
          'Modifier le mot de passe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Champ pour l'ancien mot de passe
              TextFormField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Ancien mot de passe',
                  hintText: 'Entrez votre ancien mot de passe',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.green, width: 1), // Bord visible
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.green),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre ancien mot de passe';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Champ pour le nouveau mot de passe
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nouveau mot de passe',
                  hintText: 'Entrez votre nouveau mot de passe',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.green, width: 1), // Bord visible
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.green),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nouveau mot de passe';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Champ pour la confirmation du nouveau mot de passe
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  hintText: 'Confirmez votre nouveau mot de passe',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.green, width: 1), // Bord visible
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.green),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez confirmer votre mot de passe';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Bouton pour sauvegarder le mot de passe
              Align(
                alignment: Alignment.centerRight, // Aligne le bouton à droite
                child: ElevatedButton(
                  onPressed: _changePassword,
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

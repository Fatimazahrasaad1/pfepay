import 'package:flutter/material.dart';
import 'package:mkadia/views/parametre/paiementsave.dart';
import 'package:mkadia/views/home/HomeView.dart';
import 'package:mkadia/views/parametre/update_adresses_livraison.dart' as livraison;
import 'package:mkadia/views/parametre/change_mot_de_pass.dart';
import 'package:mkadia/views/parametre/gerer_la_confidentialité.dart' as confidentialite;
import 'package:mkadia/views/profil/profil.dart';

class ParametrePage extends StatefulWidget {
  const ParametrePage({Key? key}) : super(key: key);

  @override
  ParametrePageState createState() => ParametrePageState();
}

class ParametrePageState extends State<ParametrePage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(
              title: 'Notifications',
              children: [
                SwitchListTile(
                  title: const Text('Activer les notifications'),
                  value: _notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildCard(
              title: 'Méthodes de paiement',
              children: [
                ListTile(
                  leading: const Icon(Icons.payment, color: Colors.green),
                  title: const Text('Ajouter un mode de paiement'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSavePage(), // Correction ici
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildCard(
              title: 'Préférences de livraison',
              children: [
                ListTile(
                  leading: const Icon(Icons.local_shipping, color: Colors.green),
                  title: const Text('Modifier l\'adresse de livraison'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => livraison.UpdateAdressesLivraisonPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildCard(
              title: 'Sécurité et confidentialité',
              children: [
                ListTile(
                  leading: const Icon(Icons.lock, color: Colors.green),
                  title: const Text('Changer le mot de passe'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeMotDePassePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.security, color: Colors.green),
                  title: const Text('Gérer la confidentialité'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => confidentialite.GererLaConfidentialitePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.green),
              title: const Text('Voir le profil utilisateur'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }
}
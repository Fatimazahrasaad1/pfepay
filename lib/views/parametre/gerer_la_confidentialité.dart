import 'package:flutter/material.dart';

class GererLaConfidentialitePage extends StatefulWidget {
  @override
  _GererLaConfidentialitePageState createState() =>
      _GererLaConfidentialitePageState();
}

class _GererLaConfidentialitePageState
    extends State<GererLaConfidentialitePage> {
  bool _isDataSharingEnabled = true;
  bool _isLocationEnabled = true;
  bool _isNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sécurité et Confidentialité',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSettingTile(
                title: 'Partage de données',
                description: 'Gérez vos préférences de partage de données.',
                value: _isDataSharingEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _isDataSharingEnabled = value;
                  });
                },
              ),
              _buildSettingTile(
                title: 'Localisation',
                description: 'Activez ou désactivez l\'accès à votre localisation.',
                value: _isLocationEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _isLocationEnabled = value;
                  });
                },
              ),
              _buildSettingTile(
                title: 'Notifications',
                description: 'Recevez des notifications concernant la confidentialité.',
                value: _isNotificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _isNotificationsEnabled = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              value: value,
              onChanged: onChanged,
              title: Text(
                value ? 'Activé' : 'Désactivé',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: value ? Colors.green : Colors.red,
                ),
              ),
              subtitle: Text(
                'Cliquez pour changer',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

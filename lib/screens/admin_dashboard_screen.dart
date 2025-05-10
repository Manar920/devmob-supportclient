import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart'; // adapte le chemin selon ton projet

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  // Fonction de déconnexion
  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord - Support'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Déconnexion',
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Tickets à traiter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // à remplacer par liste réelle
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text('Ticket #$index'),
                    subtitle: const Text('Client: client@example.com\nPriorité: Haute'),
                    trailing: DropdownButton<String>(
                      value: 'En cours',
                      items: const [
                        DropdownMenuItem(value: 'Nouveau', child: Text('Nouveau')),
                        DropdownMenuItem(value: 'En cours', child: Text('En cours')),
                        DropdownMenuItem(value: 'Résolu', child: Text('Résolu')),
                        DropdownMenuItem(value: 'Fermé', child: Text('Fermé')),
                      ],
                      onChanged: (value) {
                        // Mettre à jour le statut du ticket
                      },
                    ),
                    onTap: () {
                      // Aller aux détails du ticket
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

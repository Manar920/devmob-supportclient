import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart'; // adapte le chemin selon ton projet

class ClientDashboardScreen extends StatelessWidget {
  const ClientDashboardScreen({super.key});

  // Fonction de déconnexion
  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Déconnecté avec succès')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord - Client'),
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
              'Mes Tickets',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // à remplacer par les tickets récupérés via Provider
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Ticket #$index'),
                  subtitle: const Text('Statut : En cours'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Naviguer vers détails ticket
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers l’écran de création de ticket
        },
        child: const Icon(Icons.add),
        tooltip: 'Nouveau ticket',
      ),
    );
  }
}

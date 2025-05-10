import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'screens/client_dashboard_screen.dart';
import 'screens/admin_dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Support Client',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/clientDashboard': (context) => ClientDashboardScreen(),
        '/adminDashboard': (context) => AdminDashboardScreen(),
      },
    );
  }
}

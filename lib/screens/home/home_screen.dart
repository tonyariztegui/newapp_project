// home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newapp_project/providers/auth_provider.dart';
import 'package:newapp_project/widgets/common_widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    int currentIndex = 0; // Vous pouvez gérer cela avec un State Management comme Provider

    return Scaffold(
      appBar: AppBar(
        title: Text(authProvider.isLoggedIn
            ? 'Welcome, ${authProvider.username}'
            : 'Welcome!'),
        automaticallyImplyLeading: false, // Désactiver le bouton retour
      ),
      body: const Center(
        child: Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: currentIndex,
        onTap: (index) {
          // Gérer la navigation vers les différentes pages
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              Navigator.pushNamed(context, '/favorites');
              break;
            case 3:
              Navigator.pushNamed(context, '/basket');
              break;
            case 4:
              // Vérifiez si l'utilisateur est connecté avant de naviguer
              // si (user.isLoggedIn) {
              //   Navigator.pushNamed(context, '/profile');
              // } else {
              //   Navigator.pushNamed(context, '/sign_in');
              // }
              break;
          }
        },
      ),
    );
  }
}
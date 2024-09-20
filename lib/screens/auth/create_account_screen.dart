// create_account_screen.dart
import 'package:flutter/material.dart';
import 'package:newapp_project/services/auth_service.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _createAccount(BuildContext context) {
    // Implémentez la logique pour créer un compte avec auth_service
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Créer un compte")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Nom d'utilisateur"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Mot de passe"),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => _createAccount(context),
              child: Text("Créer un compte"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Déjà un compte ? Connexion"),
            ),
          ],
        ),
      ),
    );
  }
}

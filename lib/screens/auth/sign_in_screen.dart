import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newapp_project/providers/auth_provider.dart';
import 'package:newapp_project/screens/auth/create_account_screen.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        automaticallyImplyLeading: false, // Désactiver le bouton retour
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .login(_usernameController.text);
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).guestLogin();
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Continue as Guest'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                );
              },
              child: Text("Créer un compte"),
            ),
          ],
        ),
      ),
    );
  }
}
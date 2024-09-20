import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newapp_project/providers/auth_provider.dart';
import 'orders_screen.dart';
import 'returns_screen.dart';
import 'personal_details_screen.dart';
import 'package:newapp_project/screens/auth/sign_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authProvider.isLoggedIn
                  ? 'Hi ${authProvider.username}'
                  : 'Sign in for a personalized experience!',
              style: TextStyle(fontSize: 24),
            ),
            ListTile(
              title: Text('Orders'),
              onTap: () {
                if (authProvider.isLoggedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrdersScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                }
              },
            ),
            ListTile(
              title: Text('Returns'),
              onTap: () {
                if (authProvider.isLoggedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReturnsScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Personal Details'),
              onTap: () {
                if (authProvider.isLoggedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalDetailsScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: John Doe'), // Remplace par les données réelles
            SizedBox(height: 8),
            Text('Email: johndoe@example.com'), // Remplace par les données réelles
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Action pour modifier les détails
              },
              child: Text('Edit Details'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newapp_project/providers/returns_provider.dart';

class ReturnsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final returnsProvider = Provider.of<ReturnsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Returns')),
      body: ListView.builder(
        itemCount: returnsProvider.returns.length,
        itemBuilder: (context, index) {
          final returnItem = returnsProvider.returns[index];
          return ListTile(
            title: Text('Return #${returnItem.id}'), // Assurez-vous que l'objet a un attribut 'id'.
            subtitle: Text('Reason: ${returnItem.reason}'), // Assurez-vous que l'objet a un attribut 'reason'.
          );
        },
      ),
    );
  }
}

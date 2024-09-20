import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newapp_project/providers/orders_provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: ListView.builder(
        itemCount: ordersProvider.orders.length,
        itemBuilder: (context, index) {
          final order = ordersProvider.orders[index];
          return ListTile(
            title: Text('Order #${order.id}'), // Assurez-vous que l'objet a un attribut 'id'.
            subtitle: Text('Total: \$${order.total}'), // Assurez-vous que l'objet a un attribut 'total'.
          );
        },
      ),
    );
  }
}

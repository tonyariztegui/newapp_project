import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order {
  final String id;
  final double total;

  Order({required this.id, required this.total});
}

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  Future<void> fetchOrders() async {
    // Simule la récupération des données depuis l'API
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Récupérer les données des commandes stockées
    // Remplacer ceci par une vraie requête API
    // _orders = await ApiService.getOrders(); 
    notifyListeners();
  }

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  // Ajoute d'autres méthodes si nécessaire (comme supprimer une commande)
}

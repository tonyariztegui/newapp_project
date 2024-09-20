import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReturnItem {
  final String id;
  final String reason;

  ReturnItem({required this.id, required this.reason});
}

class ReturnsProvider with ChangeNotifier {
  List<ReturnItem> _returns = [];

  List<ReturnItem> get returns => _returns;

  Future<void> fetchReturns() async {
    // Simule la récupération des données depuis l'API
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Récupérer les données de retour stockées
    // Remplacer ceci par une vraie requête API
    // _returns = await ApiService.getReturns();
    notifyListeners();
  }

  void addReturn(ReturnItem returnItem) {
    _returns.add(returnItem);
    notifyListeners();
  }

  // Ajoute d'autres méthodes si nécessaire (comme supprimer un retour)
}

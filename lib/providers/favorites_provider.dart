import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newapp_project/models/product_model.dart'; // N'oublie pas d'importer ton modèle

class FavoritesProvider with ChangeNotifier {
  List<Product> _favoriteItems = [];

  List<Product> get favoriteItems => _favoriteItems;

  void addToFavorites(Product product) {
    _favoriteItems.add(product);
    notifyListeners();
    _saveFavorites();
  }

  void removeFromFavorites(String productId) {
    _favoriteItems.removeWhere((item) => item.id == productId);
    notifyListeners();
    _saveFavorites();
  }

  Future<void> _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convertir la liste de produits en une liste de chaînes
    List<String> favoritesIds = _favoriteItems.map((item) => item.id).toList();
    prefs.setStringList('favorites', favoritesIds);
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesIds = prefs.getStringList('favorites') ?? [];
    // Charger les produits à partir des IDs (nécessite un mécanisme pour récupérer les produits)
    // Par exemple, tu pourrais faire un appel à l'API pour obtenir les détails des produits
    notifyListeners();
  }
}

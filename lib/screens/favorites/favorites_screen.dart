import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newapp_project/providers/favorites_provider.dart';
import 'package:newapp_project/widgets/common_widgets/bottom_navigation_bar.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    int currentIndex = 2; // Set to 2 for the favorites tab

    return Scaffold(
      appBar: AppBar(
        title: Text('Your wishlist'),
        automaticallyImplyLeading: false, // Désactiver le bouton retour
      ),
      body: ListView.builder(
        itemCount: favoritesProvider.favoriteItems.length,
        itemBuilder: (context, index) {
          final favoriteItem = favoritesProvider.favoriteItems[index];
          return ListTile(
            title: Text(favoriteItem.name),
            subtitle: Text('\${favoriteItem.price}'),
            leading: Image.network(favoriteItem.imageUrl),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                favoritesProvider.removeFromFavorites(favoriteItem.id);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              // Already on favorites page, no action needed
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

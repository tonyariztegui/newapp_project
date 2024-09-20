import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavigationBarWidget({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            Navigator.pushNamed(context, '/favorites');
            break;
          case 3:
            Navigator.pushNamed(context, '/basket');
            break;
          case 4:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
      selectedItemColor: const Color.fromARGB(255, 28, 94, 12),  // Couleur des éléments sélectionnés
      unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),   // Couleur des éléments non sélectionnés
      backgroundColor: const Color.fromARGB(255, 211, 202, 202), // Couleur de fond de la barre
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Basket',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

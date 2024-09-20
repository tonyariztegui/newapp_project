import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newapp_project/providers/cart_provider.dart';
import 'package:newapp_project/widgets/common_widgets/bottom_navigation_bar.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    int currentIndex = 3; // Set to 3 for the basket tab

    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
        automaticallyImplyLeading: false, // Désactiver le bouton retour
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your basket is empty'))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                return ListTile(
                  title: Text(cartItem.name),
                  subtitle: Text('\${cartItem.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      cartProvider.removeFromCart(cartItem.id);
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
              Navigator.pushNamed(context, '/favorites');
              break;
            case 3:
              // Already on the basket screen, no need to navigate
              break;
            case 4:
              // Uncomment and implement the logic for profile/sign in navigation
              // if (user.isLoggedIn) {
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
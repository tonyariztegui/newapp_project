import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/orders_provider.dart';
import 'providers/returns_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/auth/sign_in_screen.dart';
import 'screens/favorites/favorites_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/basket/basket_screen.dart';
import 'package:newapp_project/screens/search/search_screen.dart';
import 'package:newapp_project/screens/search/product_detail_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
        ChangeNotifierProvider(create: (_) => ReturnsProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return MaterialApp(
          title: 'Shirt Avenue',
          theme: ThemeData(primarySwatch: Colors.green),
          initialRoute: authProvider.isLoggedIn ? '/home' : '/sign_in',
          routes: {
            '/sign_in': (context) => SignInScreen(),
            '/home': (context) => HomeScreen(),
            '/search': (context) => SearchScreen(),
            '/favorites': (context) => FavoritesScreen(),
            '/basket': (context) => BasketScreen(),
            '/profile': (context) => ProfileScreen(),
            '/product_detail': (context) => ProductDetailsScreen(),
          },
        );
      },
    );
  }
}

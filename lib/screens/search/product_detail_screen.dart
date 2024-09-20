import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the product passed through the arguments
    final Map<String, dynamic> product = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image (placeholder)
            Center(
              child: Image.asset(
                'assets/images/product_image.png',  // Replace with actual product image if available
                height: 250,
              ),
            ),
            SizedBox(height: 16),
            
            // Product Name
            Text(
              product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            
            // Product Short Description
            Text(
              product['description'],
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            
            // Product Price
            Text(
              '\$${product['price'].toString()}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 16),
            
            // Product Size
            Text(
              'Available Sizes: ${product['sizes'].join(', ')}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            
            // Product Color
            Text(
              'Color: ${product['color']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            
            // Add to Cart Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add product to cart functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to Cart')),
                  );
                },
                child: Text('Add to Cart', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

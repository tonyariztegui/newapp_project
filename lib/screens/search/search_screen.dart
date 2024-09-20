import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  List<Map<String, dynamic>> allProducts = [
    {'name': 'Product 1', 'category': 'Women'},
    {'name': 'Product 2', 'category': 'Men'},
    {'name': 'Product 3', 'category': 'Accessories'},
    {'name': 'Product 4', 'category': 'Women'},
    {'name': 'Product 5', 'category': 'Men'},
    // Add more products here
  ];

  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = allProducts; // Display all products by default
  }

  void _filterProducts() {
    setState(() {
      _filteredProducts = allProducts.where((product) {
        return (product['name'].toLowerCase().contains(_searchQuery.toLowerCase())) &&
               (_selectedCategory == 'All' || product['category'] == _selectedCategory);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for a product...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                  _filterProducts();
                });
              },
            ),
            SizedBox(height: 16),
            
            // Categories (Women, Men, Accessories)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _categoryButton('All'),
                _categoryButton('Women'),
                _categoryButton('Men'),
                _categoryButton('Accessories'),
              ],
            ),
            SizedBox(height: 8),
            
            // Filter Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Implement the filter functionality here later
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.filter_list),
                    SizedBox(width: 5),
                    Text('Filter'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            
            // Products List (filtered)
            Expanded(
              child: ListView.builder(
                itemCount: _filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = _filteredProducts[index];
                  return ListTile(
                    title: Text(product['name']),
                    subtitle: Text(product['category']),
                    onTap: () {
                      // Navigate to product detail page
                      Navigator.pushNamed(context, '/product_detail', arguments: product);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Category Button Widget
  Widget _categoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedCategory = category;
          _filterProducts();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedCategory == category ? Colors.blue : Colors.grey, // Highlight selected category
      ),
      child: Text(category),
    );
  }
}
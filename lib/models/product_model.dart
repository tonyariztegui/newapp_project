class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl; // Ajout de l'attribut imageUrl

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl, // Ajoute imageUrl dans le constructeur
  });
}

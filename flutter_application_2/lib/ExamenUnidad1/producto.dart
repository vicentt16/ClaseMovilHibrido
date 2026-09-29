class Producto {
  const Producto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
    );
  }
}
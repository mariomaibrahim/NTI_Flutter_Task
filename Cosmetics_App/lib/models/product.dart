class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final double rating;
  final String description;
  final String category;
  final List<String>? sizes;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    required this.category,
    this.sizes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'] ?? 'No Title',
      image: json['image'] ?? '',
      description: json['description'] ?? 'No description available',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] is double)
          ? json['price']
          : 0.0,
      rating: (json['rating'] != null && json['rating']['rate'] != null)
          ? (json['rating']['rate'] as num).toDouble()
          : 0.0,
      sizes: ['S', 'M', 'L', 'XL'],
      category:json ['category']?? '',
    );
  }
}

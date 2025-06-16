class CoffeeModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final String category;
  final bool isFavorite;
  final double rating;

  CoffeeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
    this.isFavorite = false,
    this.rating = 0.0,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      category: json['category'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imagePath,
      'category': category,
      'isFavorite': isFavorite,
      'rating': rating,
    };
  }

  CoffeeModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? imagePath,
    String? category,
    bool? isFavorite,
    double? rating,
  }) {
    return CoffeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      rating: rating ?? this.rating,
    );
  }
}

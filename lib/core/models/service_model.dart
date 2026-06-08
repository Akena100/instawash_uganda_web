class Service {
  final String id;
  final String name;
  final String description;
  final String category;
  final String icon;
  final String imageUrl;
  final List<String> additionalImages;
  final double price;
  final double rating;
  final int reviews;
  final String duration;
  final List<String> features;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    required this.imageUrl,
    this.additionalImages = const [],
    required this.price,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.features,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      icon: json['icon'] as String,
      imageUrl: json['imageUrl'] as String,
      additionalImages: json['additionalImages'] != null ? List<String>.from(json['additionalImages'] as List) : [],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'] as int,
      duration: json['duration'] as String,
      features: List<String>.from(json['features'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'icon': icon,
      'imageUrl': imageUrl,
      'additionalImages': additionalImages,
      'price': price,
      'rating': rating,
      'reviews': reviews,
      'duration': duration,
      'features': features,
    };
  }
}

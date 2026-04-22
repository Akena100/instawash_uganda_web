class Project {
  final String id;
  final String title;
  final String description;
  final String category;
  final String client;
  final String imageUrl;
  final List<String> services;
  final String outcome;
  final String completionDate;
  final String? testimonial;
  final String? testimonialAuthor;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.client,
    required this.imageUrl,
    required this.services,
    required this.outcome,
    required this.completionDate,
    this.testimonial,
    this.testimonialAuthor,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      client: json['client'] as String,
      imageUrl: json['imageUrl'] as String,
      services: List<String>.from(json['services'] as List),
      outcome: json['outcome'] as String,
      completionDate: json['completionDate'] as String,
      testimonial: json['testimonial'] as String?,
      testimonialAuthor: json['testimonialAuthor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'client': client,
      'imageUrl': imageUrl,
      'services': services,
      'outcome': outcome,
      'completionDate': completionDate,
      'testimonial': testimonial,
      'testimonialAuthor': testimonialAuthor,
    };
  }
}

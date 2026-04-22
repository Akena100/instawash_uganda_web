class Picture {
  final String id;
  final String title;
  final String description;
  final String imagePath;

  Picture({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imagePath': imagePath,
    };
  }
}

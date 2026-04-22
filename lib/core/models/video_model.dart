class Video {
  final String id;
  final String title;
  final String description;
  final String youtubeId;
  final String category;
  final String channel;
  final String thumbnailUrl;
  final DateTime uploadedAt;
  final bool featured;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.youtubeId,
    required this.category,
    required this.channel,
    required this.thumbnailUrl,
    required this.uploadedAt,
    this.featured = false,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      youtubeId: json['youtubeId'] as String,
      category: json['category'] as String,
      channel: json['channel'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      featured: json['featured'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'youtubeId': youtubeId,
      'category': category,
      'channel': channel,
      'thumbnailUrl': thumbnailUrl,
      'uploadedAt': uploadedAt.toIso8601String(),
      'featured': featured,
    };
  }
}

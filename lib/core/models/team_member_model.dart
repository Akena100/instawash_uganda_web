class TeamMember {
  final String id;
  final String name;
  final String role;
  final String department;
  final String imageUrl;
  final String bio;
  final String? email;
  final String? phone;
  final Map<String, String>? social; // twitter, linkedin, instagram

  TeamMember({
    required this.id,
    required this.name,
    required this.role,
    required this.department,
    required this.imageUrl,
    required this.bio,
    this.email,
    this.phone,
    this.social,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      department: json['department'] as String,
      imageUrl: json['imageUrl'] as String,
      bio: json['bio'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      social: json['social'] as Map<String, String>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'department': department,
      'imageUrl': imageUrl,
      'bio': bio,
      'email': email,
      'phone': phone,
      'social': social,
    };
  }
}

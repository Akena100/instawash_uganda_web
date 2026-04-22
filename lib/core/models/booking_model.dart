class Booking {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String serviceId;
  final String serviceName;
  final DateTime date;
  final String time;
  final String location;
  final String notes;
  final String status; // pending, confirmed, completed, cancelled
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.serviceId,
    required this.serviceName,
    required this.date,
    required this.time,
    required this.location,
    required this.notes,
    required this.status,
    required this.createdAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      serviceId: json['serviceId'] as String,
      serviceName: json['serviceName'] as String,
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
      location: json['location'] as String,
      notes: json['notes'] as String? ?? '',
      status: json['status'] as String? ?? 'pending',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'serviceId': serviceId,
      'serviceName': serviceName,
      'date': date.toIso8601String(),
      'time': time,
      'location': location,
      'notes': notes,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

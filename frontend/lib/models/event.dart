class CampusEvent {
  final int id;
  final String title;
  final String description;
  final String location;
  final String eventDate;
  final String eventTime;
  final String createdAt;

  CampusEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.eventDate,
    required this.eventTime,
    required this.createdAt,
  });

  factory CampusEvent.fromJson(Map<String, dynamic> json) {
    return CampusEvent(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      eventDate: json['event_date'] as String,
      eventTime: json['event_time'] as String,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'event_date': eventDate,
      'event_time': eventTime,
      'created_at': createdAt,
    };
  }
}

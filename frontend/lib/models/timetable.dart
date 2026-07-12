class TimetableEntry {
  final int id;
  final String courseName;
  final String instructor;
  final String roomNumber;
  final String dayOfWeek;
  final String startTime;
  final String endTime;

  TimetableEntry({
    required this.id,
    required this.courseName,
    required this.instructor,
    required this.roomNumber,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory TimetableEntry.fromJson(Map<String, dynamic> json) {
    return TimetableEntry(
      id: json['id'] as int,
      courseName: json['course_name'] as String,
      instructor: json['instructor'] as String,
      roomNumber: json['room_number'] as String,
      dayOfWeek: json['day_of_week'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_name': courseName,
      'instructor': instructor,
      'room_number': roomNumber,
      'day_of_week': dayOfWeek,
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}

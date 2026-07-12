class LostFoundItem {
  final int id;
  final String title;
  final String description;
  final String itemType; // 'lost' or 'found'
  final String location;
  final String? imageUrl;
  final int userId;
  final String username;
  final String userEmail;
  final String createdAt;
  final List<LostFoundReply>? replies;

  LostFoundItem({
    required this.id,
    required this.title,
    required this.description,
    required this.itemType,
    required this.location,
    this.imageUrl,
    required this.userId,
    required this.username,
    required this.userEmail,
    required this.createdAt,
    this.replies,
  });

  factory LostFoundItem.fromJson(Map<String, dynamic> json) {
    var repliesList = json['replies'] as List?;
    List<LostFoundReply>? parsedReplies = repliesList != null
        ? repliesList.map((r) => LostFoundReply.fromJson(r as Map<String, dynamic>)).toList()
        : null;

    return LostFoundItem(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      itemType: json['item_type'] as String,
      location: json['location'] as String,
      imageUrl: json['image_url'] as String?,
      userId: json['user_id'] as int,
      username: json['username'] as String? ?? 'Unknown',
      userEmail: json['user_email'] as String? ?? '',
      createdAt: json['created_at'] as String,
      replies: parsedReplies,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'item_type': itemType,
      'location': location,
      'image_url': imageUrl,
      'user_id': userId,
      'username': username,
      'user_email': userEmail,
      'created_at': createdAt,
      'replies': replies?.map((r) => r.toJson()).toList(),
    };
  }
}

class LostFoundReply {
  final int id;
  final int itemId;
  final int userId;
  final String username;
  final String userEmail;
  final String content;
  final String createdAt;

  LostFoundReply({
    required this.id,
    required this.itemId,
    required this.userId,
    required this.username,
    required this.userEmail,
    required this.content,
    required this.createdAt,
  });

  factory LostFoundReply.fromJson(Map<String, dynamic> json) {
    return LostFoundReply(
      id: json['id'] as int,
      itemId: json['item_id'] as int,
      userId: json['user_id'] as int,
      username: json['username'] as String? ?? 'Unknown',
      userEmail: json['user_email'] as String? ?? '',
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item_id': itemId,
      'user_id': userId,
      'username': username,
      'user_email': userEmail,
      'content': content,
      'created_at': createdAt,
    };
  }
}

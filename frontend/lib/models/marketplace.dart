 class MarketplaceItem {
  final int id;
  final String title;
  final String description;
  final double price;
  final String? imageUrl;
  final int sellerId;
  final String sellerName;
  final String sellerEmail;
  final String createdAt;

  MarketplaceItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.sellerId,
    required this.sellerName,
    required this.sellerEmail,
    required this.createdAt,
  });

  factory MarketplaceItem.fromJson(Map<String, dynamic> json) {
    return MarketplaceItem(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String?,
      sellerId: json['seller_id'] as int,
      sellerName: json['seller_name'] as String? ?? 'Unknown Seller',
      sellerEmail: json['seller_email'] as String? ?? '',
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'seller_id': sellerId,
      'seller_name': sellerName,
      'seller_email': sellerEmail,
      'created_at': createdAt,
    };
  }
}

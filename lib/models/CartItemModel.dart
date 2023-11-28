class CartItem {
  final String productId;
  final String productName;
  final double price;
  int quantity;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    this.quantity = 1,
  });

  // Add toJson and fromJson methods for serialization/deserialization
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      productName: json['productName'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}

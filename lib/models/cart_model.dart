class CartItem {
  String name;
  String restaurant;
  double price;
  String image;
  int quantity;

  CartItem({
    required this.name,
    required this.restaurant,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  // Convert to Map (useful for saving to databases)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "restaurant": restaurant,
      "price": price,
      "image": image,
      "quantity": quantity,
    };
  }

  // Convert from Map
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json["name"],
      restaurant: json["restaurant"],
      price: (json["price"] as num).toDouble(),
      image: json["image"],
      quantity: json["quantity"] as int,
    );
  }
}

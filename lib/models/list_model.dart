class Item {
  final String name;
  final double price;
  final String imageUrl;

  Item({required this.name, required this.price, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price, 'imageUrl': imageUrl};
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'],
      price: (map['price'] as num).toDouble(),
      imageUrl: map['imageUrl'],
    );
  }
}

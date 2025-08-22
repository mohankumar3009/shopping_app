class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});

  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price};
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(name: map['name'], price: (map['price'] as num).toDouble());
  }
}

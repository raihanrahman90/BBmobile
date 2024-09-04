class Item {
  final String id;
  final String name;
  final int price;
  final String description;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
    );
  }
}

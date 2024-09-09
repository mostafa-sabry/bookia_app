class ProductBookModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;

  ProductBookModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductBookModel.fromJson(Map<String, dynamic> json) {
    return ProductBookModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }
}

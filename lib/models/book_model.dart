class BookModel {
  final int id;
  final String name;
  final String category;
  final String description;
  final String image;
  final double price;

  BookModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
    );
  }
}

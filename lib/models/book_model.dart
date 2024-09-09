class BookModel {
  final int? id;
  final String name;
  final String image;
  final String? price;

  BookModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}

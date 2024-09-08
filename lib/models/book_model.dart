class BookModel {
  final String title;
  final String price;
  final String image;

  BookModel({
    required this.title,
    required this.price,
    required this.image,
  });

  factory BookModel.fromJson(Map<String, dynamic> jsonData) {
    return BookModel(
      title: jsonData['title'],
      price: jsonData['price'],
      image: jsonData['image'],
    );
  }
}

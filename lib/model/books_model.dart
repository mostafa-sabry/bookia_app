class BooksModel {
  int id;
  String title;
  String category;
  String description;
  String price;
  String image;

  BooksModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'description': description,
        'price': price,
        'image': image,
      };
}

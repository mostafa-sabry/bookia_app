import 'package:bookia_store/model/books_model.dart';

class OrderModel {
  final List<BooksModel> booksModel; // تأكد من أن هذا يمثل قائمة من الكتب
  final String orderId;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final String customerAddress;
  final String totalPrice;
  final String paymentMethod;
  final String status;
  final String createdAt;

  OrderModel({
    required this.booksModel,
    required this.orderId,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.customerAddress,
    required this.totalPrice,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    var booksList = jsonData['books'] as List;
    List<BooksModel> books =
        booksList.map((bookJson) => BooksModel.fromJson(bookJson)).toList();

    return OrderModel(
      booksModel: books,
      orderId: jsonData['orderId'],
      customerName: jsonData['customerName'],
      customerEmail: jsonData['customerEmail'],
      customerPhone: jsonData['customerPhone'],
      customerAddress: jsonData['customerAddress'],
      totalPrice: jsonData['totalPrice'],
      paymentMethod: jsonData['paymentMethod'],
      status: jsonData['status'],
      createdAt: jsonData['createdAt'],
    );
  }
}

class ItemsModel {
  final String? orderId;
  final int? qty;
  final String? price;

  ItemsModel({
    required this.orderId,
    required this.qty,
    required this.price,
  });

  factory ItemsModel.fromJson(jsonData) {
    return ItemsModel(
      orderId: jsonData['orderId'],
      qty: jsonData['qty'],
      price: jsonData['price'],
    );
  }
}

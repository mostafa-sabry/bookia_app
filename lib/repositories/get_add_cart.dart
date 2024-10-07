import 'package:bookia_store/core/api/api_service.dart';
import 'package:bookia_store/model/add_cart_model.dart';

class GetaAddCartRepo {
  Future<List<dynamic>> getAddCartRepo() async {
    List<dynamic> data = await ApiService()
        .get(apiUrl: 'https://api.codingarabic.online/api/cart');

    return data;
  }
}

class PostAddCart {
  Future<AddCartModel> postAddCart({required String bookId}) async {
    Map<String, dynamic> data = await ApiService().post(
      url: "https://api.codingarabic.online/api/cart",
      data: {
        'book_id': bookId,
      },
    );
    return AddCartModel.fromJson(data);
  }
}



// import 'package:bookia_store/model/books_model.dart';
// import 'package:bookia_store/model/repo/get_add_cart.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'addcart_state.dart';

// class AddcartCubit extends Cubit<AddcartState> {
//   AddcartCubit() : super(AddcartInitial());

//   final GetaAddCartRepo getaAddCartRepo = GetaAddCartRepo();

//   List<BooksModel> addCart = [];

//   void addToWishlist(BooksModel book) {
//     if (state is AddcartLoaded) {
//       final currentState = state as AddcartLoaded;
//       emit(AddcartLoaded(List.from(currentState.books)..add(book)));
//     } else {
//       emit(AddcartLoaded([book]));
//     }
//   }

//   void removeFromWishlist(BooksModel book) {
//     if (state is AddcartLoaded) {
//       final currentState = state as AddcartLoaded;
//       emit(AddcartLoaded(List.from(currentState.books)..remove(book)));
//     }
//   }

//   getAddCart() async {
//     try {
//       emit(AddcartLoading());
//       addCart = await getaAddCartRepo.getAddCartRepo();
//       emit(AddcartLoaded(addCart));
//     } on DioError {
//       emit(AddcartError());
//     } catch (e) {
//       emit(AddcartError());
//     }
//   }
// }

// class GetaAddCartRepo {
//   Future<List<BooksModel>> getAddCartRepo() async {
//     final data = await ApiService()
//         .get(apiUrl: "https://api.codingarabic.online/api/cart");

//     List<BooksModel> addCart = [];
//     BooksModel addCartModel;

//     for (var item in data['data']) {
//       addCartModel = BooksModel.fromJson(item);
//       addCart.add(addCartModel);
//     }
//     return addCart;
//   }
// }

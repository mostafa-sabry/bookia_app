import 'package:bookia_store/core/api/api_service.dart';

class GetWishListRepo {
  Future<List<dynamic>> getWishListRepo() async {
    List<dynamic> data = await ApiService()
        .get(apiUrl: 'https://api.codingarabic.online/api/wishlist/get');

    return data;
  }
}

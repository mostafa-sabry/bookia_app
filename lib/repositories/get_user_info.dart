// import 'package:bookia_store/core/api/api_service.dart';
// import 'package:bookia_store/model/profiel_user.dart';
// import 'package:dio/dio.dart';

// class GetUserInfoRepo {
//   Future<UserInfo> getUserInfoRepo(String token) async {
//     try {
//       final response = await ApiService().get(
//         apiUrl: 'https://api.codingarabic.online/api/user',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       return UserInfo.fromJson(response['data']);
//     } on DioException catch (e) {
//       throw Exception('Failed to fetch user info: ${e.message}');
//     }
//   }
// }

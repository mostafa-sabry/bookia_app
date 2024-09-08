import 'package:dio/dio.dart';

class AuthApiService{
  Dio dio = Dio();

  postData() async{
   final response =await dio.post("https://api.codingarabic.online/api/auth/login",data: {
    "email":"mostafa@eraasoft.com",
    "password":"12345678"
   },);
   Map<String,dynamic> jsonData= response.data;
   Map<String,dynamic> data = jsonData['data'];
   String token = data['token'];
  }
}

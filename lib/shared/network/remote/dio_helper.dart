//
// import 'package:dio/dio.dart';
//
// class dioHelper
// {
//    static late Dio dio;
//    static init(){
//      dio = Dio(
//        BaseOptions(
//          baseUrl: 'https://student.valuxapps.com/api/',
//          receiveDataWhenStatusError: true,
//        ),
//      );
//   }
//   static Future <Response> getData({
//     required String url,
//     Map <String,dynamic>? query,
//     String lang = "en",
//     String? token,
//   })
//   async {
//     dio.options.headers = {
//       "Content-Type" : "application/json",
//       "lang":lang,
//       "authorization":token
//     };
//      return await dio.get(url);
//   }
//   static Future<Response>postData({
//   required url,
//      Map <String,dynamic>? query,
//     required Map<String,dynamic> data,
//     String lang = "en",
//     String? token,
// })
//   async
//   {
//     dio.options.headers =
//     {
//       "Content-Type" : "application/json",
//       "lang":lang,
//       "authorization":token
//   };
//     return await dio.post(url,data:data,queryParameters: query);
//   }
//
//    static Future<Response>putData({
//      required url,
//      Map <String,dynamic>? query,
//      required Map<String,dynamic> data,
//      String lang = "en",
//      String? token,
//    })
//    async
//    {
//      dio.options.headers =
//      {
//        "Content-Type" : "application/json",
//        "lang":lang,
//        "authorization":token
//      };
//      return await dio.put(url,data:data,queryParameters: query);
//    }
// }
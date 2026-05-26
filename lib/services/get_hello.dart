import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetHello {
  final Dio dio;

  GetHello(this.dio);

  Future<String> getHello() async {
    final response = await dio.get("${dotenv.env['API_BASE_URL']}/hello/");
    return response.data["message"];
  }
}

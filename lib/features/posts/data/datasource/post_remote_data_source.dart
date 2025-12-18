import 'package:architecture_bloc/core/errors/failure.dart';
import 'package:architecture_bloc/core/network/dio_client.dart';
import 'package:dio/dio.dart';

Dio http = DioClient.instance();

class PostRemoteDataSource {
  Future<List<dynamic>> getPosts() async {
    try {
      final response = await http.get(
        "/posts/",
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Failure(message: e.message as String);
    } catch (e) {
      throw Exception();
    }
  }
}

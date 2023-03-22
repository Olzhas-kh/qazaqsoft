import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_app/resourse/data_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/users/1';

  Future<DataModelJson> fetchUserList() async {
    try {
      Response response = await _dio.get(_url);
      print(response.data.toString());

      return DataModelJson.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      
      return DataModelJson.withError("Data not found / Connection issue" );
    }
  }
}
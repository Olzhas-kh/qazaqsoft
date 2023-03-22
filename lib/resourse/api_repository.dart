import 'package:test_app/resourse/data_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<DataModelJson> fetchUserList() {
    return _provider.fetchUserList();
  }
}

class NetworkError extends Error {}
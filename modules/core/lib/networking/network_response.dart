import 'package:core/core.dart';

import 'network_mappers.dart';

class NetworkResponse<T> {
  final T body;

  final bool isRequestSuccess;
  final String? errorMessage;

  NetworkResponse(
    this.body,
    this.isRequestSuccess,
    this.errorMessage,
  );
}

class BoolResponse extends BoolMappable {
  bool? resBool;

  BoolResponse({this.resBool});
}

class BaseEmptyResponse extends EmptyMappable {}

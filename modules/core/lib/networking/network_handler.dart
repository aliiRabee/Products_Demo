import 'dart:developer';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';

class NetworkHandler {
  final Dio dio;

  NetworkHandler(this.dio);

  Future<NetworkResponse<ResponseType>> get<ResponseType extends Mappable>(
      ResponseType responseType, String url,
      {var body}) async {
    var response;
    try {
      response = await dio.get(url, queryParameters: body);
      debugPrint("***************GET $url , query: $body ***************");
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> post<ResponseType extends Mappable>(
      ResponseType responseType, String url,
      {var body, encoding, bool isAuth = false}) async {
    var response;
    debugPrint("*************** POST $url , body: $body ***************");
    try {
      dio.options.headers = {'Accept': 'application/json'};
      response = await dio.post(url,
          data: body, options: Options(requestEncoder: encoding));
      print(response);
    } on DioException catch (e) {
      print(e);
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> put<ResponseType extends Mappable>(
      ResponseType responseType, String url,
      {var body, encoding, Map<String, String>? headers}) async {
    var response;
    debugPrint("*************** PUT $url , body: $body ***************  ");

    try {
      if (headers != null) {
        dio.options.headers = headers;
      }
      response = await dio.put(url,
          data: body, options: Options(requestEncoder: encoding));
    } on DioException catch (e) {
      //  print(e.toString());
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> patch<ResponseType extends Mappable>(
      ResponseType responseType, String url,
      {var body, encoding, Map<String, String>? headers}) async {
    var response;
    debugPrint("*************** PATCH $url , body: $body ***************  ");

    try {
      if (headers != null) {
        dio.options.headers = headers;
      }
      response = await dio.patch(url,
          data: body, options: Options(requestEncoder: encoding));
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> delete<ResponseType extends Mappable>(
      ResponseType responseType, String url,
      {var body, encoding}) async {
    var response;
    debugPrint("*************** Delete $url , body: $body ***************  ");

    try {
      response = await dio.delete(url,
          data: body, options: Options(requestEncoder: encoding));
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  NetworkResponse<ResponseType> handleResponse<ResponseType extends Mappable>(
      Response response, ResponseType responseType) {
    debugPrint(response.toString());
    try {
      final int statusCode = response.statusCode!;
      if (statusCode != 200) {
        log("RESPONSE   ${response.data}");
      }
      if (statusCode >= 200 && statusCode < 300 && statusCode != 204) {
        if (responseType is ListMappable) {
          return NetworkResponse<ResponseType>(
              Mappable(responseType, response.data) as ResponseType, true, "");
        } else {
          return NetworkResponse<ResponseType>(
              Mappable(responseType, response) as ResponseType, true, "");
        }
      } else if (statusCode == 204) {
        return NetworkResponse<ResponseType>(
            Mappable(responseType, "") as ResponseType, true, "");
      } else if (statusCode == 401) {
        return NetworkResponse<ResponseType>(
            Mappable(responseType, response) as ResponseType,
            false,
            response.data['errors'][0]['title']);
      } else if (statusCode == 404) {
        return NetworkResponse<ResponseType>(
            Mappable(responseType, response) as ResponseType,
            false,
            response.data['errors'][0]['title']);
      } else {
        return NetworkResponse<ResponseType>(
            Mappable(responseType, response) as ResponseType,
            false,
            response.data['errors'][0]['title'] ?? "unexpected error");
      }
    } on DioException catch (e) {
      return NetworkResponse<ResponseType>(
          Mappable(responseType, response) as ResponseType, false, e.message);
    } catch (e) {
      return NetworkResponse<ResponseType>(
          Mappable(responseType, response) as ResponseType,
          false,
          e.toString());
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hfk_flutter_clone/core/app_constants.dart';
import 'package:hfk_flutter_clone/core/app_urls.dart';
import 'package:hfk_flutter_clone/model/login/login_response_model.dart';
import 'package:hfk_flutter_clone/networking/api_response.dart';
import 'package:hfk_flutter_clone/networking/network_api_service.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  final _apiService = NetworkAPIService();

  Future<ApiResponse<LoginResponseModel>> loginApi(var data) async {
    try {
      dynamic response = await _apiService.postApi(data, AppUrls.requestTypeLoginAPI);
      return returnResponse(response);
    } on SocketException {
      return ApiResponse.error("No Internet connection");
    } on TimeoutException {
      return ApiResponse.error("Request timed out");
    } on HttpException {
      return ApiResponse.error("Couldn't find the get");
    } on FormatException {
      return ApiResponse.error("Bad response format");
    } catch (e) {
      return ApiResponse.error("Unexpected error: $e");
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case AppConstants.HTTP_STATUS_200:
        return ApiResponse.completed(jsonDecode(response.body));
      case AppConstants.HTTP_STATUS_400:
        return ApiResponse.error("Bad Request: ${response.body}");
      case AppConstants.HTTP_STATUS_401:
        return ApiResponse.error("Unauthorized: ${response.body}");
      case AppConstants.HTTP_STATUS_403:
        return ApiResponse.error("Forbidden: ${response.body}");
      case AppConstants.HTTP_STATUS_404:
        return ApiResponse.error("Not Found: ${response.body}");
      case AppConstants.HTTP_STATUS_500:
        return ApiResponse.error("Internal Server Error: ${response.body}");
      case AppConstants.HTTP_STATUS_502:
        return ApiResponse.error("Bad Gateway: ${response.body}");
      case AppConstants.HTTP_STATUS_503:
        return ApiResponse.error("Service Unavailable: ${response.body}");
      case AppConstants.HTTP_STATUS_504:
        return ApiResponse.error("Gateway Timeout: ${response.body}");
      default:
        return ApiResponse.error("Unknown Error: ${response.statusCode}");
    }
  }
}

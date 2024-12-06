import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hfk_flutter_clone/core/app_constants.dart';
import 'package:hfk_flutter_clone/networking/api_response.dart';
import 'package:hfk_flutter_clone/networking/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkAPIService extends BaseAPIService {
  final logger = Logger();

  @override
  Future getApi(String url) async {
    if(kDebugMode) {
      print(url);
    }

    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(minutes: 3));
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

  @override
  Future postApi(data, String url) async{
    if (kDebugMode) {
      print(url);
      print(data);
    }

    try {
      logger.e("POST API: ${json.encode(data)}");
      final response = await http.post(Uri.parse(url), body: json.encode(data)).timeout(const Duration(minutes: 3));
      logger.e(response.statusCode);
      logger.e(response.body);
      return response;
    } on SocketException {
      throw SocketException;
      //return ApiResponse.error("No Internet connection");
    } on TimeoutException {
      throw TimeoutException;
      //return ApiResponse.error("Request timed out");
    } on HttpException {
      throw HttpException;
      //return ApiResponse.error("Couldn't find the post");
    } on FormatException {
      throw FormatException;
      //return ApiResponse.error("Bad response format");
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
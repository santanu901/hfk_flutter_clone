import 'package:hfk_flutter_clone/core/app_urls.dart';
import 'package:hfk_flutter_clone/networking/network_api_service.dart';

class LoginRepository {
  final _apiService = NetworkAPIService();

  Future<dynamic> loginApi(var data) async {
    dynamic response =
        await _apiService.postApi(data, AppUrls.requestTypeLoginAPI);
    return response;
  }
}

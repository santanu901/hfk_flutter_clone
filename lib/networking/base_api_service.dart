abstract class BaseAPIService {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);
}

import 'package:get/get.dart';
import 'package:hfk_flutter_clone/model/login/login_request_model.dart';
import 'package:hfk_flutter_clone/model/login/login_response_model.dart';
import 'package:hfk_flutter_clone/networking/api_response.dart';
import 'package:hfk_flutter_clone/networking/api_response_status.dart';
import 'package:hfk_flutter_clone/ui/login/login_repository.dart';
import 'package:logger/logger.dart';

class LoginViewModel extends GetxController {
  final logger = Logger();
  final _loginRepository = LoginRepository();

  Rx<ApiResponse<LoginResponseModel>> loginResponseObserver =
      ApiResponse<LoginResponseModel>.viewMode().obs;

  Future<void> callLoginApi({required LoginRequestModel loginRequestModel}) async {
    loginResponseObserver.value = ApiResponse.loading();

    Map loginRequestMap = loginRequestModel.toJson();
    var loginResponse =
        await _loginRepository.loginApi(loginRequestMap);

    if (loginResponse.status == APIResponseStatus.ERROR) {
      loginResponseObserver.value = ApiResponse.error(loginResponse.message);
    } else if(loginResponse.status == APIResponseStatus.COMPLETED) {
      loginResponseObserver.value = ApiResponse.completed(loginResponse.data);
    }
  }
}

import 'package:hfk_flutter_clone/networking/api_response_status.dart';

class ApiResponse<T> {
  APIResponseStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.viewMode() : status = APIResponseStatus.VIEW_MODE;
  ApiResponse.loading() : status = APIResponseStatus.LOADING;
  ApiResponse.completed(this.data) : status = APIResponseStatus.COMPLETED;
  ApiResponse.error(this.message) : status = APIResponseStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
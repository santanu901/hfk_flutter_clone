import 'package:hfk_flutter_clone/model/login/userdata.dart';

class LoginResponseModel {
  bool? success;
  String? message;
  UserData? userData;

  LoginResponseModel({this.success, this.message, this.userData});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    userData = json['userData'] != null
        ? UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (userData != null) {
      data['userData'] = userData?.toJson();
    }
    return data;
  }
}
class LoginRequestModel {
  String? mobile;
  String? userType;

  LoginRequestModel({this.mobile, this.userType});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['user_type'] = userType;
    return data;
  }
}
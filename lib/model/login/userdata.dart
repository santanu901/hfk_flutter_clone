class UserData {
  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? token;
  String? email;
  String? addressVerified;
  String? userType;
  String? profilePic;
  String? stateId;
  String? stateName;
  String? districtId;
  String? countryId;
  String? districtName;
  String? blockId;
  String? blockName;
  String? pinCode;
  String? loginStatus;
  bool? isValidOtp;

  UserData(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.token,
      this.email,
      this.addressVerified,
      this.userType,
      this.profilePic,
      this.stateId,
      this.stateName,
      this.districtId,
      this.countryId,
      this.districtName,
      this.blockId,
      this.blockName,
      this.pinCode,
      this.loginStatus,
      this.isValidOtp});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    token = json['token'];
    email = json['email'];
    addressVerified = json['address_verified'];
    userType = json['user_type'];
    profilePic = json['profile_pic'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    districtId = json['district_id'];
    countryId = json['country_id'];
    districtName = json['district_name'];
    blockId = json['block_id'];
    blockName = json['block_name'];
    pinCode = json['pin_code'];
    loginStatus = json['login_status'];
    isValidOtp = json['isValidOtp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['token'] = token;
    data['email'] = email;
    data['address_verified'] = addressVerified;
    data['user_type'] = userType;
    data['profile_pic'] = profilePic;
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    data['district_id'] = districtId;
    data['country_id'] = countryId;
    data['district_name'] = districtName;
    data['block_id'] = blockId;
    data['block_name'] = blockName;
    data['pin_code'] = pinCode;
    data['login_status'] = loginStatus;
    data['isValidOtp'] = isValidOtp;
    return data;
  }
}

import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/model/userinfo.dart';

class UserinfoProvider extends ChangeNotifier {
  UserInfo _userInfo = UserInfo(
      verification_doc: "",
      issuing_state: "",
      buisness_name: "",
      registration_status: "",
      img: "",
      username: "",
      pickup_address: "",
      street_address: "",
      suburb: "",
      postcode: "",
      state: "",
      baked_type: [],
      contact_no: '');

  UserInfo get userInfo => _userInfo;

  void set_user_info(Map<String, dynamic> userInfo) {
    _userInfo = UserInfo.fromJson(userInfo);
    notifyListeners();
  }
}

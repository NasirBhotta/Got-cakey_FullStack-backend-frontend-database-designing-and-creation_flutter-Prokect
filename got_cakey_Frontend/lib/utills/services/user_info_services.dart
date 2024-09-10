import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/utills/constants/api_address.dart';
import 'package:got_cakey_mobile/model/userinfo.dart';
import 'package:got_cakey_mobile/provider/userInfo.dart';
import 'package:got_cakey_mobile/utills/tem_data_holder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoServices {
  Future<Map<String, dynamic>> setInfo(BuildContext context) async {
    try {
      var userinfoProvider =
          Provider.of<UserinfoProvider>(context, listen: false);
      UserInfo userInfo = UserInfo(
          bio: TemporaryData.bio,
          verification_doc: TemporaryData.verification_doc,
          issuing_state: TemporaryData.issuing_state,
          buisness_name: TemporaryData.buisness_name,
          registration_status: 'registered',
          img: TemporaryData.img,
          suggestion: TemporaryData.suggestion,
          username: TemporaryData.username,
          pickup_address: TemporaryData.pickup_address,
          street_address: TemporaryData.street_address,
          suburb: TemporaryData.suburb,
          postcode: TemporaryData.postcode,
          state: TemporaryData.state,
          baked_type: TemporaryData.baked_type,
          contact_no: '');
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      var token = sharedPreferences.getString('x-auth-token');

      var res = await http.post(
          Uri.parse("http://${ApiAddress.URI}:3000/gotcakey/baker/userinfo"),
          body: userInfo.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      if (res.statusCode == 200) {
        Map<String, dynamic> decodedBody = jsonDecode(res.body);
        Map<String, dynamic> finalBody =
            Map.fromEntries(decodedBody.entries.where(
          (element) => element.value != null,
        ));

        userinfoProvider.set_user_info(finalBody);
        return finalBody;
      }
    } catch (e) {
      return {'user_info': ''};
    }
    return {'user_info': ''};
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/utills/constants/api_address.dart';
import 'package:got_cakey_mobile/model/auth.dart';
import 'package:got_cakey_mobile/provider/authProvider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<Map<String, dynamic>> signUpUser(
      {required BuildContext context,
      required String email,
      required String name,
      required String password}) async {
    try {
      var authProvider = Provider.of<AuthProvider>(context, listen: false);
      User user = User(
          email: email, id: 0, password: password, token: "", type: "baker");
      var res = await http.post(
        Uri.parse("http://${ApiAddress.URI}:3000/gotcakey/auth/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      if (res.statusCode == 200) {
        var decodedBody = jsonDecode(res.body);
        if (decodedBody['token'] != null) {
          authProvider.setUser(decodedBody);
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString(
              'x-auth-token', jsonDecode(res.body)['token']);
        }

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${jsonDecode(res.body)}")));
        return decodedBody;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${jsonDecode(res.body)}")));
        return jsonDecode(res.body);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));

      return {"token": ''};
    }
  }

  Future<Map<String, dynamic>> signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      var authProvider = Provider.of<AuthProvider>(context, listen: false);
      User user =
          User(email: email, id: 0, password: password, token: "", type: "");

      var res = await http.post(
        Uri.parse("http://${ApiAddress.URI}:3000/gotcakey/auth/login"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      if (res.statusCode == 200) {
        var decodedBody = jsonDecode(res.body);
        if (decodedBody['token'] != null) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString(
              'x-auth-token', jsonDecode(res.body)['token']);
          authProvider.setUser(decodedBody);
        }

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(jsonDecode(res.body).toString())));

        return decodedBody;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(jsonDecode(res.body).toString())));
        return jsonDecode(res.body);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return {"token": ''};
    }
  }
}

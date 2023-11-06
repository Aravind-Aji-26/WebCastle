import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:nov_project/model/homeData.dart';
import 'package:http/http.dart' as http;
class HomeProvider extends ChangeNotifier {
  HomeData? homeData;
  String? token;

  Future<String?> login() async {
    try {
      print('login called');
      final response = await http.post(Uri.parse(
          "https://s419.previewbay.com/fragrance-b2b-backend/api/v1/anonymous-login?device_token=test_token&device_type=1"));
      if (response.statusCode == 200) {
          token = jsonDecode(response.body)['data']?['access_token'];
          notifyListeners();
          print('token: $token');
          return token;

      } else {
        throw Exception('Failed to log in');
      }
    }  catch (e) {
      log(e.toString());
      // TODO
    }
  }

  Future<HomeData?> getData() async {
    await login();
    final response = await http.get(
        Uri.parse(
            "https://s419.previewbay.com/fragrance-b2b-backend/api/v1/home"),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
        homeData = HomeData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to log in');
    }
    notifyListeners();
    return homeData;

  }

}
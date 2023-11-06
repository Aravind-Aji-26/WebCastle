import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String?> login() async{
  final response = await http.post(Uri.parse("https://s419.previewbay.com/fragrance-b2b-backend/api/v1/anonymous-login?device_token=test_token&device_type=1"));
  if (response.statusCode == 200){
    final token = jsonDecode(response.body)['data']?['access_token'];
  }else {
    throw Exception('Failed to log in');
  }
return '';
}
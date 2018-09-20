import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<AccessCall> fetchPost() async {

  //String login, String password
  // Map lMap = ;
  // String lData = json.encode(lMap);  
  // String paramName = ""

  final response =
      await http.post(
        'https://testapp.nectir.co/app/api/v1/login',
        body: {"_username": "rbkshadow@gmail.com", "_password": "GeNuJHxDkEyA"});

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return AccessCall.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class AccessCall {
  final String token;
  final String refresh_token;
  
  AccessCall({this.token, this.refresh_token});

  factory AccessCall.fromJson(Map<String, dynamic> json) {

    return AccessCall(
      token: json['token'],
      refresh_token: json['refresh_token'],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  late String authToken = '';

  final url = Uri.parse('http://192.168.90.233:3000/register');

  get getToken {
    return authToken;
  }

  Future<void> register(String email) async {
    // print('INside register funtion');
    try {
      // print('THis sfsdfsdfsdf');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
          },
        ),
        headers: {
          'content-type': 'application/json',
        },
      );
      var decodedBody = json.decode(response.body);
      if (decodedBody == []) {
        print('Something went WRONG!');
      }
      authToken = decodedBody[0]['_id'];
      // print('AUth token is ${authToken}');
      // print('This is the auth response ${decodedBody[0]}');
    } catch (error) {
      print('THis is the register error ${error}');
    }
  }

  Future<void> logout() async {
    print('Inside logout');
    authToken = '';
    notifyListeners();
  }
}

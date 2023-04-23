import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  final url = Uri.parse('http://172.18.0.51:3000/register');
  Future<void> register(String email) async {
    print('INside register funtion');
    try {
      print('THis sfsdfsdfsdf');
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
      print('This is the auth response ${response.body}');
    } catch (error) {
      print('THis is tehe register error ${error}');
    }
  }
}

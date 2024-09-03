import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_app/constant/global_variables.dart';
import 'package:store_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/screen/main_screen.dart';
import 'package:store_app/services/manage_http_response.dart';

class AuthController {
  Future<void> signUpUser(
      {required context,
      required String fullName,
      required String email,
      required String password}) async {
    try {
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          state: '',
          city: '',
          locality: '',
          token: "",
          createdAt: '',
          updatedAt: '',
          password: password);
      http.Response response = await http.post(Uri.parse("$uri/auth/signUp"),
          body: user.toJson(),
          headers: {"Content-Type": 'application/json; charset=UTF-8'});
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false,
            );
            showSnackBar(context, "Account Created successfully", Colors.green);
          });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signInUser(
      {required context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/auth/signIn"),
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: jsonContentType);
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false,
            );
            showSnackBar(context, "Logged In successfully", Colors.green);
          });
    } catch (e) {
      rethrow;
    }
  }
}

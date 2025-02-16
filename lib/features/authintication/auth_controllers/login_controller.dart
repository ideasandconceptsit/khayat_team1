import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;

  void validateEmail(String value) {
    isEmailValid.value = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value);
  }

  void validatePassword(String value) {
    isPasswordValid.value = value.length >= 6;
  }
}

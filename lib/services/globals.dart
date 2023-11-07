import 'package:flutter/material.dart';

const String baseURL = "https://binfrix.com/api/";
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: const Color.fromARGB(255, 196, 36, 24),
    content: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: const Duration(seconds: 10),
  ));
}

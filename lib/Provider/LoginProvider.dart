import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  bool loading = false;
  bool get load => loading;

  setloading(var value) {
    loading = value;
    notifyListeners();
  }

  Future<String> auth(String email, String pass) async {
    setloading(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {"email": email, "password": pass},
      );
      if (response.statusCode == 200) {
        print("Successfull");
        setloading(false);
        return "Login Successful!";
      } else {
        setloading(false);
        return 'Login Failed';
      }
    } catch (e) {
      setloading(false);
      return 'An error occurred: $e';
    }
  }
}
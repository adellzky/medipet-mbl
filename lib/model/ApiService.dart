import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static const endpoint = "http://localhost:8000/api";
  Map<String, String> headers = {"Content-Type": "application/json"};

  Future<http.Response> login(String email, password) async {
    var url = Uri.parse('$endpoint/login');
    try {
      final Response = await http.post(url,
          headers: headers,
          body: json.encode({
            'email': email,
            'password': password,
          }));
      if (Response.statusCode == 200) {
        final responseData = json.decode(Response.body);
        final accessToken = responseData['access_token'];
        await saveToken(accessToken);
        return responseData;
      } else {
        throw "Failed to load data: ${Response.statusCode}";
      }
    } catch (e) {
      throw "Error fetching data: $e";
    }
  }

  Future<void> register(String name, email, password, confirmpass) async {
    try {
      final url = Uri.parse('$endpoint/register');
      final Response = await http.post(url,
          body: jsonEncode({
            'name': name,
            'email': email,
            'password': password,
            'confirmpass': confirmpass,
          }));
      if (Response.statusCode == 200) {
        final responseData = json.decode(Response.body);
        final accessToken = responseData['access_token'];
        await saveToken(accessToken);
        return responseData;
      } else {
        throw "Failed to load data: ${Response.statusCode}";
      }
    } catch (e) {
      print('Error during registration: $e');
      throw e;
    }
  }

  //menyimpan token
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', token);
  }

  //mendapatkan token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  //menghapus token
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }
}

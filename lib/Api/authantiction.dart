import 'dart:convert';

import 'package:shopnew/Api/api_utl.dart';
import 'package:shopnew/customer/user.dart';
import 'package:http/http.dart' as http;

Map<String, String> header = {"Accept": "application/json"};

class Authentication {
  Future<User> register(String first_name, String last_name, String email,
      String password) async {
    Map<String, String> body = {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
    };
    http.Response response =
        await http.post(ApiUtil.AUTH_REGISTER_URL, body: body, headers: header);

    if (response.statusCode == 201) {
      var body = jsonDecode(response.body);
      var data = body['data'];
      return User.fromJson(data);
    }return null;
  }

  Future<User> login(String email, String password) async {
    Map<String, String> body = {'email': email, 'password': password};
    print('data');

    http.Response response = await http.post(
      ApiUtil.AUTH_LOGIN_URL,
      headers: header,
      body: body,
    );
    print('afrte');
    if(response.statusCode==200){
  var body=jsonDecode(response.body);
  var data=body['data'];
  print(data);
  return User.fromJson(data);
}
    print(response.body);
    return null;
  }
}
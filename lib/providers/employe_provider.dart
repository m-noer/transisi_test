import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:transisi_test/models/employe_model.dart';
import 'dart:convert';

class EmployeProvider with ChangeNotifier {
  List<EmployeModel> _item;

  List<EmployeModel> get items {
    return [..._item];
  }

  EmployeModelAdd addData;

  Future<void> getEmploye() async {
    final url = "https://reqres.in/api/users";
    final response = await http.get(url);

    final extractData = json.decode(response.body)['data'];
    if (response.statusCode == 200) {
      _item = extractData
          .map<EmployeModel>((i) => EmployeModel.fromJson(i))
          .toList();
    }
    notifyListeners();
  }

  String firstName = '';
  String lastName = '';
  String email = '';
  String avatar = '';
  bool addStatus = false;

  Future<void> addEmploye(firstName, lastName, email) async {
    addStatus = false;
    // gambar avatar dibuat default karena api tidak bisa upload gambar
    Map<String, dynamic> body = {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar':
          'https://i.pinimg.com/originals/7c/c7/a6/7cc7a630624d20f7797cb4c8e93c09c1.png',
    };

    final url = "https://reqres.in/api/users";
    final response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: body,
    );

    final extractData = json.decode(response.body);
    addStatus = true;

    addData = EmployeModelAdd.fromJson(extractData);
    notifyListeners();
  }

  String token;

  Future<void> login(email, password) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    final url = "https://reqres.in/api/login";
    final response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: body,
    );

    final extractData = json.decode(response.body);
    addStatus = false;

    token = extractData['token'];
    print(token);
    notifyListeners();
  }
}

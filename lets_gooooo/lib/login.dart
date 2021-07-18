import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _read(context);
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Login', style: TextStyle(fontSize: 30)),
            Container(
              height: 50.0,
              width: 300.0,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              //decoration: BoxDecoration(
              //   border: Border.all(color: Color.fromRGBO(0, 0, 0, 1))),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
                controller: usernameController,
              ),
            ),
            Container(
              height: 50.0,
              width: 300.0,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              //decoration: BoxDecoration(
              //    border: Border.all(color: Color.fromRGBO(0, 0, 0, 1))),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                controller: passwordController,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.

                  _login(usernameController.text, passwordController.text,
                      context);
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_read(context) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'authToken';
  final value = prefs.getString(key) ?? '';
  if (value != '') {
    Navigator.of(context).pushNamed(HomePage.route);
  }
}

_login(username, password, context) async {
  final response = await http.post(
    Uri.parse('https://lets-gooooo.herokuapp.com/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'username': username, 'password': password}),
  );

  if (response.statusCode == 200) {
    dynamic json = jsonDecode(response.body);
    if (json['message'] == "Success") {
      Navigator.of(context).pushNamed(HomePage.route);
      _save(username);
    } else {
      print(json);
      print("Failed!");
    }
  }
}

_save(value) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'authToken';

  prefs.setString(key, value);
  print('saved $value');
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'profile.dart';
import 'signup.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lets Goooo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          WelcomePage.route: (context) => WelcomePage(),
          LoginPage.route: (context) => LoginPage(),
          SignupPage.route: (context) => SignupPage(),
          HomePage.route: (context) => HomePage(),
          ProfilePage.route: (context) => ProfilePage(),
        });
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  static const String route = '/';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Let's Gooooo!", style: TextStyle(fontSize: 50)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginPage.route);
                },
                child: const Text('Login'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignupPage.route);
                },
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_read() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'my_string_key';
  final value = prefs.getString(key) ?? '';
  print('read: $value');
}

_save(value) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'my_string_key';

  prefs.setString(key, value);
  print('saved $value');
}

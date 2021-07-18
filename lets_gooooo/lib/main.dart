import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  Navigator.of(context).pushNamed(HomePage.route);
                  _read();
                  _save(usernameController.text);
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

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);
  static const String route = '/signup';
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Sign Up', style: TextStyle(fontSize: 30)),
            Container(
              height: 50.0,
              width: 300.0,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              //decoration: BoxDecoration(
              //   border: Border.all(color: Color.fromRGBO(0, 0, 0, 1))),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                controller: emailController,
              ),
            ),
            Container(
              height: 50.0,
              width: 300.0,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
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
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                controller: passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.

                  _read();
                  _save(usernameController.text);
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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  static const String route = '/home';
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProfilePage.route);
                },
                child: const Text('Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  static const String route = '/profile';
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<ProfilePage> {
  final usernameChangeController = TextEditingController();
  final passwordChangeController = TextEditingController();
  final emailChangeController = TextEditingController();
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg')),
                Container(
                    child: Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text('Past Journeys'),
                            Container(
                                height: 50,
                                child: Column(
                                  children: [
                                    Text('journey 1'),
                                    Text('journey 2'),
                                    Text('journey 3')
                                  ],
                                ))
                          ],
                        )))
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Center(child: Text('Profile')),
                Container(
                    alignment: Alignment.topLeft,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                            child: Column(
                          children: [
                            Text('Change Email'),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'New Email',
                              ),
                              controller: passwordChangeController,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                              },
                              child: const Text('Change Email'),
                            ),
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Text('Change Username'),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'New Username',
                              ),
                              controller: emailChangeController,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                              },
                              child: const Text('Change Username'),
                            ),
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Text('Change Password'),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'New password',
                              ),
                              controller: passwordChangeController,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                              },
                              child: const Text('Change Password'),
                            ),
                          ],
                        )),
                      ],
                    ))),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                            child: Column(
                          children: [],
                        ))
                      ],
                    )))
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text('Hiking Since'),
                Text('placeholder'),
                Text('Total Points Collected'),
                Text('placeholder'),
                Text('Total Points Of Interest Visited'),
                Text('placeholder'),
                Text('Total Distance Hiked'),
                Text('placeholder'),
                Text('Journeys Completed'),
                Text('placeholder'),
                Text('Highest Point'),
                Text('placeholder'),
                Text('Average Speed'),
                Text('placeholder'),
                Text('Average Time Per Journey'),
                Text('placeholder'),
                Text('Last Journey'),
                Text('placeholder')
              ],
            ),
          )
        ],
      )),
    );
  }
}

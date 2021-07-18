import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

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
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final usernameChangeController = TextEditingController();
  final passwordChangeController = TextEditingController();
  final emailChangeController = TextEditingController();
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Center(
                  child: Text('Profile', style: TextStyle(fontSize: 30)),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                            child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Change Email',
                                    style: TextStyle(fontSize: 25)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'New Email',
                                ),
                                controller: emailChangeController,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                  },
                                  child: const Text('Change Email'),
                                ),
                              ),
                            ),
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Change Username',
                                      style: TextStyle(fontSize: 25)),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'New Username',
                                ),
                                controller: usernameChangeController,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                  },
                                  child: const Text('Change Username'),
                                ),
                              ),
                            ),
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Change Password',
                                    style: TextStyle(fontSize: 25)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'New Password',
                                ),
                                controller: passwordChangeController,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                  },
                                  child: const Text('Change Password'),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ))),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text('User Statistics', style: TextStyle(fontSize: 30)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Hiking Since:', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2021', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total Points Collected:',
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('0', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total Points Of Interest Visited:',
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('0', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total Distance Hiked:',
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('0', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Journeys Completed:',
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('There\'s a first time for everything!',
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Highest Point:', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('---', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Average Speed:', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('----', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Average Time Per Journey:',
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('----', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Last Journey:', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('----', style: TextStyle(fontSize: 20)),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

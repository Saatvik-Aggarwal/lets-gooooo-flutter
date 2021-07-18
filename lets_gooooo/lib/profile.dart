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

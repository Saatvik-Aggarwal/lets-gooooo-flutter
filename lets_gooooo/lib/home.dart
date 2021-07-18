import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:lets_gooooo/trail_model.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'profile.dart';

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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService httpService = HttpService();
  late List<String> trailTitles = [];
  late List<String> trailLengths = [];
  late List<String> trailThumbnails = [];
  late List<String> trailDescriptions = [];
  @override
  void initState() {
    getTrails(0.25, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProfilePage.route);
                },
                child: const Text('My Profile'),
              )),
              Expanded(
                  flex: 9,
                  child: Text(
                    'Name / Description',
                    textAlign: TextAlign.center,
                  )),
              Expanded(flex: 2, child: Text('Approx. Length (miles)')),
              Expanded(flex: 1, child: Text('Image')),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: trailTitles.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(maxWidth: 800),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  trailTitles[index],
                                  style: TextStyle(
                                      color: Color(0xFF264653), fontSize: 24),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 400,
                                child: Text(
                                  trailDescriptions[index]
                                      .replaceAll(RegExp(r'\<.*?\>'), ""),
                                ),
                              )
                            ],
                          ),
                          Text(
                            trailLengths[index],
                            textAlign: TextAlign.right,
                          ),
                          Image.network(
                            trailThumbnails[index],
                            height: 150,
                            width: 150,
                          )
                        ],
                      )),
                  onTap: () {
                    launch('https://www.google.com/maps/search/?api=1&query=' +
                        Uri.encodeComponent(trailTitles[index]));
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
            },
          ),
        ),
      ],
    ));
  }
  // return Material(
  //   child: Center(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 5.0),
  //           ,
  //         ),

  //       ],
  //     ),
  //   ),
  // );
  void getTrails(radius, page) async {
    final response = await http.get(
      Uri.parse('https://geolocation-db.com/json/'),
    );

    print(response.body);

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      final res = await http.post(
        Uri.parse('https://lets-gooooo.herokuapp.com/getTrails'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'latitude': json['latitude'],
          "longitude": json['longitude'],
          "radius": radius,
          "page": page
        }),
      );
      print("1");
      if (res.statusCode == 200) {
        print("2");
        dynamic body = jsonDecode(res.body);
        print("2.5");
        print(body['message']);
        //print(body);
        if (body['message'] == 'Success') {
          print("2.9");
          dynamic data = jsonDecode(jsonEncode(body['data']));
          print(data.runtimeType);
          setState(() {
            trailTitles = data.map<String>((m) => m['name'] as String).toList();
            trailLengths = data
                .map<String>((m) => (m['length'] ?? "Unknown").toString())
                .toList();
            trailThumbnails = data
                .map<String>((m) => (m['thumbnail'] ??
                        "https://th.bing.com/th/id/R.58e452b97cf0d2738cb27ea41be447df?rik=350d6Oe8P6NmfA&riu=http%3a%2f%2fvignette4.wikia.nocookie.net%2fepicrapbattlesofhistory%2fimages%2f4%2f4f%2fWhite_square.jpg%2frevision%2flatest%3fcb%3d20140413154605&ehk=OZQCbu4ieaNlCA8666xXzkxrLw57gDqFrPw%2bFdxEbUY%3d&risl=&pid=ImgRaw")
                    as String)
                .toList();
            trailDescriptions = data
                .map<String>((m) => (m['description'] ??
                        "We don't know too much about this trail, but we're sure its great!")
                    as String)
                .toList();
          });
        } else {
          print("2.75");
          print(body.message);
        }
      } else {
        print("4");
      }
    }
  }
}

class HttpService {
  Future<List<String>> getTrails(double radius, int page) async {
    final response = await http.get(
      Uri.parse('https://geolocation-db.com/json/'),
    );

    print(response.body);

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      final res = await http.post(
        Uri.parse('https://lets-gooooo.herokuapp.com/getTrails'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'latitude': json['latitude'],
          "longitude": json['longitude'],
          "radius": radius,
          "page": page
        }),
      );
      print("1");
      if (res.statusCode == 200) {
        print("2");
        dynamic body = jsonDecode(res.body);
        print("2.5");
        print(body['message']);
        //print(body);
        if (body['message'] == 'Success') {
          print("2.9");
          dynamic data = jsonDecode(jsonEncode(body['data']));
          print(data.runtimeType);
          List<String> trails =
              data.map<String>((m) => m['name'] as String).toList();
          print("2.96");
          List<Trail> trailss =
              data.map<Trail>((m) => Trail.fromJson(m)).toList();

          print(trailss);

          print("3");
          return trails;
        } else {
          print("2.75");
          print(body.message);
        }
      } else {
        print("4");
      }
    }
    List<String> trails = [];
    return trails;
  }
}

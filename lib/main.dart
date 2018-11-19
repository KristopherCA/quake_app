import 'package:flutter/material.dart';
import 'json.dart';
import 'list.dart';

Map data;
List features;

void main() async {
  data = await getQuakes();
  features = data['features'];

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Quake',
    theme: ThemeData(
      primaryColor: Colors.blue.shade800,
    ),
    home: Quakes(),
  ));
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quakes around the World'),
        centerTitle: true,
      ),
      body: Center(child: list),
    );
  }
}

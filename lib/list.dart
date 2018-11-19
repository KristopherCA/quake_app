import 'package:flutter/material.dart';
import 'main.dart';
import 'package:intl/intl.dart';
import 'alert.dart';

ListView list = ListView.builder(
    padding: EdgeInsets.all(15.0),
    itemCount: features.length,
    itemBuilder: (BuildContext context, int position) {
      if (position.isOdd) return Divider();
      final index = position ~/ 2;

      var date = DateTime.fromMicrosecondsSinceEpoch(
          features[index]['properties']['time'] * 1000,
          isUtc: true);
      var format = DateFormat("yMd");
      var formatTime = DateFormat("jm");

      var updated = DateTime.fromMicrosecondsSinceEpoch(
          features[index]['properties']['updated'] * 1000,
          isUtc: true);

      var dateString = format.format(date);
      var timeString = formatTime.format(date);
      var updateString = format.format(updated);
      var updateTimeString = formatTime.format(updated);

      return ListTile(
        title: Text(
          "Magnitude: ${features[index]['properties']['mag']}",
          style: TextStyle(
              fontSize: 19.5, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "Place: ${features[index]['properties']['place']}" +
              "\nTime: $timeString",
          style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              fontStyle: FontStyle.italic),
        ),
        leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            maxRadius: 33.0,
            child: Center(
              child: Text(
                "$dateString",
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
              ),
            )),
        onTap: () {
          showAlertMessage(
              context,
              "Type: ${features[index]['properties']['type']}" +
                  "\nStatus: ${features[index]['properties']['status']}" +
                  "\nUpdated: $updateString At $updateTimeString");
        },
      );
    });

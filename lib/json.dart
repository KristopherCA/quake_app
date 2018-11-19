import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Map> getQuakes() async {
  String apiURL =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  http.Response response = await http.get(apiURL);

  return json.decode(response.body);
}

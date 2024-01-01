import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/model/jsonmodel.dart';

class JsonProvider extends ChangeNotifier {
  List<jsonData> jsondata = [];

  Future<void> getdata() async {
    String data = await rootBundle.loadString('assets/jsondata/jasondata.json');
    Map<String, dynamic> map = jsonDecode(data);
    List listdata = map['planets'];
    jsondata = listdata
        .map((e) => jsonData(
            name: e['name'],
            period: e['period'],
            discription: e['description'],
            distance: e['distance'],
            image: e['image'],
            radius: e['radius'],
            velocity: e['velocity']))
        .toList();
    notifyListeners();
  }
}

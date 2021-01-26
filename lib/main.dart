import 'package:covid_dictionary/details.dart';
import 'package:flutter/material.dart';
import 'package:covid_dictionary/list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DictList(),
    onGenerateRoute: (settings) {
      if (settings.name.split("/")[1] == "details") {
        return MaterialPageRoute(
          builder: (context) =>
              DictDetails(int.parse(settings.name.split("/")[2])),
        );
      }
    },
  ));
}

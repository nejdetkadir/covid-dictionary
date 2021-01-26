import 'package:flutter/material.dart';
import 'package:covid_dictionary/model/dictionary.dart';
import 'dart:math' as math;
import 'dart:convert';

class DictList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DictList();
}

class _DictList extends State<DictList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 SÖZLÜĞÜ"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: randomColor(),
                        child: Text("${snapshot.data[index].key[0]}"),
                      ),
                      title: Text("${snapshot.data[index].key}"),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () =>
                          {Navigator.pushNamed(context, "/details/$index")},
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Color randomColor() {
    return Color.fromARGB(
      255,
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
    );
  }
}

Future<List<Dictionary>> getData(BuildContext context) async {
  var data =
      await DefaultAssetBundle.of(context).loadString("assets/data.json");
  return (json.decode(data) as List)
      .map((data) => Dictionary.fromJsonMap(data))
      .toList();
}

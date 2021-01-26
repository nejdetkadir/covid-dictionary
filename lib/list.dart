import 'package:flutter/material.dart';
import 'dart:math' as math;

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
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              elevation: 8,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: randomColor(),
                  child: Text("$index"),
                ),
                title: Text("key $index"),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () => {Navigator.pushNamed(context, "/details/$index")},
              ),
            );
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

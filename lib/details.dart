import 'package:flutter/material.dart';
import 'package:covid_dictionary/list.dart';

class DictDetails extends StatefulWidget {
  int index;
  DictDetails(this.index);
  @override
  State<StatefulWidget> createState() => _DictDetails(index);
}

class _DictDetails extends State<DictDetails> {
  int selectedIndex;
  _DictDetails(this.selectedIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                title: Text("${snapshot.data[selectedIndex].key}"),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/cover.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "${snapshot.data[selectedIndex].key}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 25, right: 25, top: 15),
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "${snapshot.data[selectedIndex].value}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

import 'package:flutter/material.dart';

class DictDetails extends StatelessWidget {
  int index;
  DictDetails(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            title: Text("value $index"),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Text("value $index"),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

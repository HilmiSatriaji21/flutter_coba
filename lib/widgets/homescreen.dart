import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart' as data;
import '../provinsi.dart' as provinsi;
import '../global2.dart' as global;


void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Tampilan Tab Bar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'TRAKING COVID',
            style: TextStyle(fontSize: 16.0),
          ),
          bottom: PreferredSize(
              child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text('Kasus Covid-19'),
                    ),
                    Tab(
                      child: Text('Provinsi'),
                    ),
                    Tab(
                      child: Text('Global'),
                    ),
                  ]),
              preferredSize: Size.fromHeight(30.0)),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: new data.Data(),
            ),
            Container(
              child: new provinsi.Provinsi(),
            ),
            Container(
              child: new global.Global(),
            ),
          ],
        ),
      ),
    );
  }
}
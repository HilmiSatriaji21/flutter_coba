import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Center(
                child: Text(
              'KAWAL COVID',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            )),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Center(
                child: Text(
              'Data Kasus Covid-19 Indonesia',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Card(
              child: Container(
                height: 80,
                color: Colors.red[700],
                child: ListTile(
                  title: Text("Positif"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/sedih.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Card(
              child: Container(
                height: 80,
                color: Colors.green[700],
                child: ListTile(
                  title: Text("Sembuh"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/senang.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Card(
              child: Container(
                height: 80,
                color: Colors.yellow[700],
                child: ListTile(
                  title: Text("Meninggal"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/sedih2.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Card(
              child: Container(
                height: 80,
                color: Colors.blue[700],
                child: ListTile(
                  title: Text("Indonesia"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/indonesia.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
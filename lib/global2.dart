import './model/get_post_modelglob.dart';
import './controller/get_post_global.dart';
import 'package:flutter/material.dart';

class Global extends StatelessWidget {
  final GetPostGlob _getPost = new GetPostGlob();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getPost.manggilPostData(),
          builder: (context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> dataPost = snapshot.data;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Negara')),
                    DataColumn(label: Text('Positif')),
                    DataColumn(label: Text('Sembuh')),
                    DataColumn(label: Text('Meninggal')),
                  ],
                  rows: dataPost
                      .map((Post dataPost) =>
                      DataRow(cells: [
                        DataCell(Text(dataPost.countryRegion.toString())),
                        DataCell(Text(dataPost.confirmed.toString())),
                        DataCell(Text(dataPost.recovered.toString())),
                        DataCell(Text(dataPost.deaths.toString())),
                      ]))
                      .toList(),
                )));              
            }
             else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(strokeWidth:5),
                  Center(
                    child: Text(
                      "Sabar...",
                      style: TextStyle(height: 5),
                    ),
                  ),
                ],
              );
             }
          }),
    );
  }
}
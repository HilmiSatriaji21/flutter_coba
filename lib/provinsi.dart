import './model/get_post_modelprov.dart';
import './controller/get_post_prov.dart';
import 'package:flutter/material.dart';

class Provinsi extends StatelessWidget {
  final GetPostProv _getPost = new GetPostProv();

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
                    DataColumn(label: Text('Kode Provinsi')),
                    DataColumn(label: Text('Provinsi')),
                    DataColumn(label: Text('Positif')),
                    DataColumn(label: Text('Sembuh')),
                    DataColumn(label: Text('Meninggal')),
                  ],
                  rows: dataPost
                      .map((Post dataPost) =>
                      DataRow(cells: [
                        DataCell(Text(dataPost.kode_provi.toString())),
                        DataCell(Text(dataPost.provinsi)),
                        DataCell(Text(dataPost.kasus_posi.toString())),
                        DataCell(Text(dataPost.kasus_semb.toString())),
                        DataCell(Text(dataPost.kasus_meni.toString())),
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
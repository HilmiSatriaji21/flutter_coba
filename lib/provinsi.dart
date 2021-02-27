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
              return ListView.builder(
                itemCount: dataPost.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.coronavirus,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          Text('Kode Provinsi :\n' +
                              dataPost[index].kode_provi.toString()),
                          Text('Provinsi :\n' + dataPost[index].provinsi),
                          Text('Positif :\n' +
                              dataPost[index].kasus_posi.toString()),
                          Text('Sembuh :\n' +
                              dataPost[index].kasus_semb.toString()),
                          Text('Meninggal :\n' +
                              dataPost[index].kasus_meni.toString())
                        ],
                      ),
                    ),
                  );
                },
              );
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
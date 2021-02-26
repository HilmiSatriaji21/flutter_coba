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
                              Icons.people,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          Text('Kode Provinsi :' +
                              dataPost[index].kode_provi.toString()),
                          Text('Provinsi :' + dataPost[index].provinsi),
                          Text('Positif :' +
                              dataPost[index].kasus_posi.toString()),
                          Text('Sembuh :' +
                              dataPost[index].kasus_semb.toString()),
                          Text('Meninggal :' +
                              dataPost[index].kasus_meni.toString())
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
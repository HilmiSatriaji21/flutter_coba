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
                          Text('Negara :' +
                              dataPost[index].countryRegion.toString()),
                          Text('Positif :' +
                              dataPost[index].confirmed.toString()),
                          Text('Sembuh :' +
                              dataPost[index].recovered.toString()),
                          Text('Meninggal :' +
                              dataPost[index].deaths.toString())
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
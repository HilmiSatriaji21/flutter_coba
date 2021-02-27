import 'package:flutter/material.dart';
import './model/get_post_modelind.dart';
import './controller/get_post_ind.dart';
import 'package:flutter_coba/detail_post.dart';

class Indonesia extends StatelessWidget {
  final GetPostInd _getPost = new GetPostInd();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Global & Indonesia'),
      ),
      body: FutureBuilder(
        future: _getPost.manggilPostData(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> dataPost = snapshot.data;
            return ListView.builder(
              itemCount: dataPost.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.coronavirus,
                            size: 30,
                            color: Colors.amber,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                dataPost[index].name,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DetailPost(
                                        name: dataPost[index].name,
                                        positif: dataPost[index].positif,
                                        sembuh: dataPost[index].sembuh,
                                        meninggal: dataPost[index].meninggal
                                      ),
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 80,
                                      height: 30,
                                      color: Colors.blue,
                                      child:
                                          Center(child: Text('Lihat Detail')),
                                    ),
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
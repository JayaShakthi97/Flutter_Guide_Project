import 'package:flutter/material.dart';
import 'package:flutter_guide_project/_api/api.dart';
import 'package:flutter_guide_project/_models/Post.dart';
import 'package:flutter_guide_project/widgets/postListItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = API.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guide Project')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<Post>>(
            future: _posts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                List<Post> posts = snapshot.data;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => PostListItem(
                    post: posts[index],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

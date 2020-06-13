import 'package:flutter/material.dart';
import 'package:flutter_guide_project/_api/api.dart';
import 'package:flutter_guide_project/_models/Post.dart';

class PostScreen extends StatefulWidget {
  final int postId;

  const PostScreen({Key key, @required this.postId}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Future<Post> _post;
  @override
  void initState() {
    super.initState();
    _post = API.getPost(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Post>(
            future: _post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                Post post = snapshot.data;
                return Column(
                  children: <Widget>[
                    Text(
                      post.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(post.body),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_guide_project/_api/api.dart';
import 'package:flutter_guide_project/_models/Post.dart';
import 'package:flutter_guide_project/_utils/routes.dart';
import 'package:flutter_guide_project/screens/addItem.dart';
import 'package:flutter_guide_project/widgets/postListItem.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppRoutes.goto(context, AddItemScreen()),
        child: Icon(Icons.add),
      ),
    );
  }
}

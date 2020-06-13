import 'package:flutter/material.dart';
import 'package:flutter_guide_project/_models/Post.dart';
import 'package:flutter_guide_project/_utils/routes.dart';
import 'package:flutter_guide_project/screens/item.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  const PostListItem({Key key, this.post}) : super(key: key);

  _gotoPost(context) {
    AppRoutes.goto(context, PostScreen(postId: post.id));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title ?? 'Post Title'),
        subtitle: Text(post.body ?? 'Post Body',
            maxLines: 2, overflow: TextOverflow.fade),
        onTap: () => _gotoPost(context),
      ),
    );
  }
}

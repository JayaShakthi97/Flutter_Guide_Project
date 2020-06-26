import 'package:flutter/material.dart';
import 'package:flutter_guide_project/_utils/routes.dart';
import 'package:flutter_guide_project/screens/SelectPage.dart';
import 'package:flutter_guide_project/screens/posts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                AppRoutes.goto(context, PostsPage());
              },
              child: Text('Posts Page'),
            ),
            RaisedButton(
              onPressed: () {
                AppRoutes.goto(context, SelectPage());
              },
              child: Text('Select Page'),
            ),
          ],
        ),
      ),
    );
  }
}

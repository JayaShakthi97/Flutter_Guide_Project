import 'package:flutter/material.dart';
import 'package:flutter_guide_project/_utils/routes.dart';
import 'package:flutter_guide_project/constants/strings.dart';
import 'package:flutter_guide_project/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      AppRoutes.replace(context, HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(AppStrings.welcomeText),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function ontap;
  final bool loading;

  const CustomButton({Key key, this.text, this.ontap, this.loading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (loading) return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    );
    return Container(
      child: RaisedButton(
        onPressed: ontap,
        child: Text(text ?? 'Button Text'),
      ),
    );
  }
}

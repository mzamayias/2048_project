import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.string,
  }) : super(key: key);

  final String string;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: FlatButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            string,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed ?? () => print('"$buttonText" pressed!'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      color: Colors.blueAccent[700],
      splashColor: Colors.grey[850].withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

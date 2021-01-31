import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key key,
    @required this.onPressed,
    @required this.buttonText,
  }) : super(key: key);

  final Function onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) => FlatButton(
        onPressed: onPressed ?? () => print('"$buttonText" pressed!'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(21.0)),
        ),
        color: Colors.blueAccent[700],
        splashColor: Colors.grey[850].withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[50],
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}

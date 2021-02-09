import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key key,
    this.flex,
    @required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  final int flex;
  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => print('"$buttonText" pressed!'),
      child: Expanded(
        flex: flex ?? 1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(21)),
          ),
          color: Colors.blueAccent[700],
          elevation: 0,
          shadowColor: Colors.transparent,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(21),
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
          ),
        ),
      ),
    );
  }
}

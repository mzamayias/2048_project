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
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.grey[850],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      elevation: 3,
      child: FlatButton(
        onPressed: onPressed ?? () => debugPrint('"$buttonText" pressed!'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(21)),
        ),
        color: Colors.blueAccent[700],
        focusColor: Colors.grey[850].withOpacity(0.3),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(21),
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
    );
  }
}

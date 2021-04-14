import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sButton extends StatelessWidget {

  final Color surfaceColor;
  final Color txtColor;
  final String text;

  sButton({@required this.surfaceColor, @required this.txtColor, @required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
      style: TextStyle(
        color: txtColor,
        fontSize: 15.0,
        fontFamily: 'San francisco',
        wordSpacing: 2.0,
        letterSpacing: 1.0
      ),),
        style: ElevatedButton.styleFrom(
          onSurface: surfaceColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            //minimumSize: Size.zero,
        ),
    );
  }
}

class fButton extends StatelessWidget {

  final Color txtColor;
  final String text;
  final Function callback;
  final Color btnColor;

  fButton({@required this.txtColor, @required this.text, @required this.callback, @required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
        style: TextStyle(
            color: txtColor,
            fontSize: 15.0,
            fontFamily: 'San francisco',
            wordSpacing: 2.0,
            letterSpacing: 1.0
        ),),
      style: ElevatedButton.styleFrom(
        primary: btnColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
      ),
      onPressed: () => callback(),
    );
  }
}

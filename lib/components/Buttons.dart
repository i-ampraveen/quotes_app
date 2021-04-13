import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sButton extends StatelessWidget {

  final Color btnColor;
  final Color txtColor;
  final String text;

  sButton({@required this.btnColor, @required this.txtColor, @required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
      style: TextStyle(
        color: txtColor,
        fontSize: 13.0,
        fontFamily: 'San francisco',
        wordSpacing: 2.0,
        letterSpacing: 1.0
      ),),
        style: ElevatedButton.styleFrom(
          onSurface: btnColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            minimumSize: Size.zero,
        ),
    );
  }
}

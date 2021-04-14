import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _appBarText = "Quotes";
String _fsappBarText = "Favourite Quotes";

/* App Bar Text */
Text homeScreenAppBarText =
Text(_appBarText,
    style: TextStyle(
        fontSize: 22.0,
        fontFamily: 'San francisco',
        wordSpacing: 2.0,
        letterSpacing: 1.0
    ));

Text favouritesScreenAppBarText =
Text(_fsappBarText,
    style: TextStyle(
        fontSize: 22.0,
        fontFamily: 'San francisco',
        wordSpacing: 2.0,
        letterSpacing: 1.0
    ));
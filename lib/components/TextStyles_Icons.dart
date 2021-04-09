import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _appBarText = "Quotes";
String _connectionStatus = "Status";
Color _white = Colors.white.withOpacity(0.7);

/* App Bar Text */
Text homeScreenAppBarText =
Text(_appBarText,
    style: TextStyle(
        fontSize: 22.0,
        fontFamily: 'San francisco',
        wordSpacing: 2.0,
        letterSpacing: 1.0
    ));

Text cStatusText =
Text(_connectionStatus,
    style: TextStyle(
        color: _white,
        fontSize: 13.0,
        fontFamily: 'San francisco',
        wordSpacing: 2.0,
        letterSpacing: 1.0
    ));
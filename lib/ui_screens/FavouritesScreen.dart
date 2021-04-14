import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quote_app_one/components/TextStyles_Icons.dart';
import 'package:quote_app_one/utils/HexColor.dart';

class fqListing extends StatefulWidget {
  @override
  _fqListingState createState() => _fqListingState();
}

class _fqListingState extends State<fqListing> {

  Color _newAppBgColor = HexColor("#111328");

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: _newAppBgColor, // navigation bar color
    ));
    return Scaffold(
      appBar: AppBar(
        title: favouritesScreenAppBarText,
        backgroundColor: _newAppBgColor,
      ),
      backgroundColor: _newAppBgColor,
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Center(
              child: Text(
                  "This is where your favourite quotes will be displayed",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.orangeAccent
                ),
              )),
        ),
      ),
    );
  }
}

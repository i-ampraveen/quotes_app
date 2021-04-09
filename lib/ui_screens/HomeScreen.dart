import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quote_app_one/components/TextStyles_Icons.dart';
import 'package:quote_app_one/utils/HexColor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _newAppBgColor = HexColor("#111328");

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: _newAppBgColor, // navigation bar color
    ));
    return Scaffold(
      appBar: AppBar(
        title: homeScreenAppBarText,
        backgroundColor: _newAppBgColor,
      ),
      backgroundColor: _newAppBgColor,
      body: Container(
        /* Main point, the home screen will be arranged in three rows
        * 1st Column - ConnectionStatus, Favourites button to access favourites page
        * 2nd Column - Quotes display
        * 3rd Column - Share button, favourite button*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* 1st Column entry point */
            Container(
              //width: ,
              //height: ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: cStatusText,
                  ),
                  /* TextField with rounded edges showing "online" and "offline" status
                  for online bg color of that should be in green and for offline it should be orange/red shade
                  status should get changed according to mobile internet status */

                  /* Button to access favourites list */
                ],
              ),
            ),
            /* 2nd column entry point */

            /* api will fetch the quotes, side-by-side scrolling
            * if connection status is offline then some message will be displayed */

            /* 3rd column entry point */
            new Container(
              child: Row(
                children: [
                  /* Share button - To share the quotes*/
                  /* (may be)Download button or screen capture button - It will be saved locally */
                  /* Favourites button - To add quotes to favourite list */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

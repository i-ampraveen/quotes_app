import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quote_app_one/components/Buttons.dart';
import 'package:quote_app_one/components/TextStyles_Icons.dart';
import 'package:quote_app_one/utils/HexColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _newAppBgColor = HexColor("#111328");

  Color statusColor = Colors.red;
  String cData = 'Offline';

  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() {
        _source = source;
        _updateStatusText();
      });
    });
  }

  void _updateStatusText(){
    switch (_source.keys.toList()[0]){
      case ConnectivityResult.none:
        cData = "Offline";
        statusColor = Colors.red;
        break;
      case ConnectivityResult.mobile:
        cData = "Online";
        statusColor = Colors.green;
        break;
      case ConnectivityResult.wifi:
        cData = "Online";
        statusColor = Colors.green;
        break;
    }
  }

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
        /* Main point, the home screen will be arranged in three columns
        * 1st Column - ConnectionStatus, Favourites button to access favourites page
        * 2nd Column - Quotes display
        * 3rd Column - Share button, favourite button */
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* 1st Column entry point */
            Container(
              //width: ,
              //height: ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,//.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: cStatusText,
                  ),
                  /* Button with rounded edges showing "online" and "offline" status
                  for online bg color of that should be in green and for offline it should be orange/red shade
                  status should get changed according to mobile internet status */
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0 ,0),
                        child: sButton(
                            btnColor: statusColor,
                            txtColor: statusColor,
                            text: cData,
                        ),
                      ),


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
class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}

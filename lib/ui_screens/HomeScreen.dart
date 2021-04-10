import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
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

  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: _newAppBgColor, // navigation bar color
    ));
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(360, 690),
    // );

    String string;
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        string = "Offline";
        break;
      case ConnectivityResult.mobile:
        string = "Mobile: Online";
        break;
      case ConnectivityResult.wifi:
        string = "WiFi: Online";
    }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: cStatusText,
                  ),
                  Text('$string',
                  style: TextStyle(
                    color: Colors.white
                  ),)
                  /* Button with rounded edges showing "online" and "offline" status
                  for online bg color of that should be in green and for offline it should be orange/red shade
                  status should get changed according to mobile internet status */
                  // SButton(
                  //     btnColor: btnColor,
                  //     txtColor: txtColor,
                  //     text: text,
                  //     width: width,
                  //     height: height,
                  //     size: size)

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

    @override
    void dispose() {
      _connectivity.disposeStream();
      super.dispose();
    }
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

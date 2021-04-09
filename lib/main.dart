import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

void main() => (runApp(new MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: OpeningScreen(),
      ),
    );
  }
}

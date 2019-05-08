import 'package:flutter_web/material.dart';
import 'package:flutter_web/services.dart';
import 'pages/index/index.dart';
import 'constants/index.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => DefaultTextStyle(
            child: HomePage(), style: KfontConstant.defaultStyle),
      },
      theme: ThemeData(primarySwatch: Colors.blue),
       debugShowCheckedModeBanner: false,
    );
  }
}
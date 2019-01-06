import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/index/index.dart';
import 'constants/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './pages/search/search.dart';
import 'package:flutter_shop/i10n/localization_intl.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      localizationsDelegates: [
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        KKLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
        //其它Locales
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => DefaultTextStyle(
            child: HomePage(), style: KfontConstant.defaultStyle),
        '/search': (context) => SearchPage()
      },
      theme: ThemeData(primarySwatch: Colors.blue),
       debugShowCheckedModeBanner: false,
    );
  }
}

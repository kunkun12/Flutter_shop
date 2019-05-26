import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1
import 'dart:async';
class KKLocalizations {
  static Future<KKLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new KKLocalizations();
    });
  }

  static KKLocalizations of(BuildContext context) {
    return Localizations.of<KKLocalizations>(context, KKLocalizations);
  }

  String get home {
    return Intl.message('Home');
  }

  String get cate {
    return Intl.message('Cate');
  }

  String get find {
    return Intl.message('Find');
  }

  String get cart {
    return Intl.message('Cart');
  }

  String get person {
    return Intl.message('Person');
  }
   String get search  {
    return Intl.message('Search');
  }
  
}

//Locale代理类
class KKLocalizationsDelegate extends LocalizationsDelegate<KKLocalizations> {
  const KKLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<KKLocalizations> load(Locale locale) {
    //3
    return KKLocalizations.load(locale);
  }

  // remainingEmailsMessage(int howMany) => Intl.plural(howMany,
  //     zero: 'There are no emails left',
  //     one: 'There is $howMany email left',
  //     other: 'There are $howMany emails left',
  //     name: "remainingEmailsMessage",
  //     args: [howMany],
  //     desc: "How many emails remain after archiving.",
  //     examples: const {'howMany': 42, 'userName': 'Fred'});
  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(KKLocalizationsDelegate old) => false;
}

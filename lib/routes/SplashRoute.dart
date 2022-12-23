import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/common/Global.dart';
import 'package:health/routes/HomeRoute.dart';
import 'package:health/routes/splash/SplashPage.dart';

import 'guide/GuideRoute.dart';
import 'package:health/routes/Total.dart';

class SplashRoute extends StatefulWidget {
  static const String splashName = "/splash";

  const SplashRoute({Key key,this.userid}) : super(key: key);

  final userid;
  @override
  _SplashRouteState createState() => _SplashRouteState(userid:this.userid);
}

class _SplashRouteState extends State<SplashRoute> {
  final String firstOpened = "first_opened";

  final userid;
  bool isFirstOpen = false;
  Timer _timer;

  _SplashRouteState({Key key,this.userid});

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    checkFirstOpened();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }

  ///跳转guide页面
  void navigateToGuide() {
    Navigator.of(context).pop();
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return GuideRoute();
        },
        settings: RouteSettings()));
    _timer.cancel();
  }

  ///跳转Space页面
  void navigateToHome() {
    Navigator.of(context).pop();
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return MyHomePage(userid:this.userid);
        },
        settings: RouteSettings()));
    _timer.cancel();
  }

  void startTimer() async {
    //调试过程中将开启时间 修改为3
    _timer = new Timer(Duration(milliseconds: 0), () {
      if (isFirstOpen) {
        navigateToGuide();
      } else {
        navigateToHome();
      }
    });
  }

  ///判断是否首次打开，如果首次打开返回 true，并设置已经打开过
  checkFirstOpened() async {
    bool containsFirstOpened = await Global.getPref().hasKey(firstOpened);
    if (!containsFirstOpened) {
      await Global.getPref().setStorage(firstOpened, true);
    }
    setState(() {
      isFirstOpen = !containsFirstOpened;
    });
  }
}

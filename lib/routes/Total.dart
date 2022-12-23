import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:health/routes/App.dart';
import 'package:health/routes/Person.dart';
import 'package:health/routes/HomeRoute.dart';
import 'package:health/routes/SplashRoute.dart';

import 'Explore.dart';
//MyApp 是整个app
//App是首页
//Person是 个人信息
//
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var userid;
  MyApp(id){
    this.userid=id;
    print(id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashRoute(userid:this.userid),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final userid;

  const MyHomePage({Key key, this.userid}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState(this.userid);
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedpage = 0;
  final userid;
  var _pageNo ;

  _MyHomePageState(this.userid);

  @override
  Widget build(BuildContext context) {
    this._pageNo = [App(this.userid), Explore(), Person(this.userid)];
    return Scaffold(
      
      body: _pageNo[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: new Color.fromARGB(200, 238, 128, 85),
        items: [
          TabItem(icon: Icons.brush_outlined, title: '首页'),
          TabItem(icon: Icons.favorite, title: '探索'),
          TabItem(icon: Icons.person, title: '我的')
        ],
        initialActiveIndex: selectedpage,
        onTap: (int index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}

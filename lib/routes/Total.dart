import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:health/routes/App.dart';
import 'package:health/routes/Person.dart';
import 'package:health/routes/HomeRoute.dart';
import 'package:health/routes/SplashRoute.dart';
//MyApp 是整个app
//App是首页
//Person是 个人信息
//
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashRoute(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedpage = 0;
  final _pageNo = [App(), App(), Person()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pageNo[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.person, title: '首页'),
          TabItem(icon: Icons.favorite, title: '探索'),
          TabItem(icon: Icons.brush, title: '我的')
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

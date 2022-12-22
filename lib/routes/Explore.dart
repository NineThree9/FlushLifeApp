
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/extension/ScreenExtension.dart';
import 'package:health/routes/sound/SoundRoute.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

import '../common/EventConstants.dart';
import '../report/ReportUtil.dart';
import '../widget/SlideVerticalWidget.dart';

class Explore extends StatelessWidget {
  // 重写build 方法，build 方法返回值为Widget类型，返回内容为屏幕上显示内容。

  @override
  Widget build( BuildContext  context) {
    _onMood(){Navigator.push(context, MaterialPageRoute(builder: (context){
      return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body:WebView(initialUrl: "https://www.jiandanxinli.com/knowledge"),
      ),
    );}));}
    _onTest(){Navigator.push(context, MaterialPageRoute(builder: (context){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          body:WebView(initialUrl: "https://www.xinceyan.com/"),
        ),
      );}));}
    _onWay(){Navigator.push(context, MaterialPageRoute(builder: (context){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          body:WebView(initialUrl: "https://baijiahao.baidu.com/s?id=1730773770362117043&wfr=spider&for=pc"),
        ),
      );}));}
    _onQuestiongs(){Navigator.push(context, MaterialPageRoute(builder: (context){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          body:WebView(initialUrl: "https://baijiahao.baidu.com/s?id=1695900262876487042&wfr=spider&for=pc&searchword=10%E4%B8%AA%E5%B8%B8%E8%A7%81%E7%9A%84%E5%BF%83%E7%90%86%E9%97%AE%E9%A2%98"),
        ),
      );}));}
    buildMood(){
      return GestureDetector(
        onTap: _onMood,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 16.51.pt),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imgs/home/item_page1.png"),
                fit: BoxFit.fitWidth),
          ),
          child: Stack(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.pt, right: 20.pt, top: 32.pt, bottom: 30.pt),
                  child: Text(
                    "简单心理学",
                    style: TextStyle(
                        fontSize: 25.pt,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
      ;

    }
    buildLove(){
      return GestureDetector(
        onTap: _onTest,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 16.51.pt),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imgs/home/item_page2.png"),
                fit: BoxFit.fitWidth),
          ),
          child: Stack(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.pt, right: 20.pt, top: 32.pt, bottom: 30.pt),
                  child: Text(
                    "心理测试",
                    style: TextStyle(
                        fontSize: 25.pt,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
      ;

    }
    buildAffection(){
      return GestureDetector(
     onTap: _onWay,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 16.51.pt),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imgs/home/item_page3.png"),
                fit: BoxFit.fitWidth),
          ),
          child: Stack(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.pt, right: 20.pt, top: 32.pt, bottom: 30.pt),
                  child: Text(
                    "冥想方法",
                    style: TextStyle(
                        fontSize: 25.pt,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
      ;

    }
    buildQuestion(){
      return GestureDetector(
        onTap: _onQuestiongs,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 16.51.pt),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imgs/home/item_page4.png"),
                fit: BoxFit.fitWidth),
          ),
          child: Stack(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.pt, right: 20.pt, top: 32.pt, bottom: 30.pt),
                  child: Text(
                    "青少年心理问题",
                    style: TextStyle(
                        fontSize: 25.pt,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
      ;

    }

    buildAll()
    {

      List<Widget> listView =[];
      listView.add(buildMood());
      listView.add(buildLove());
      listView.add(buildAffection());
      listView.add(buildQuestion());
      Widget content = SingleChildScrollView(
          child:Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration( //设置Container修饰
                  image: DecorationImage( //背景图片修饰
                    image: AssetImage("imgs/bg/bg_guide.jpg"),
                    fit: BoxFit.cover,)
              ),
              child:Column(
                children: listView,

              )
          )
      );
      return content;
    }


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: new Color.fromARGB(255,240, 173,160),
          title: Text('探索'),

        ),
        body:Container(
    decoration: BoxDecoration( //设置Container修饰
    image: DecorationImage( //背景图片修饰
    image: AssetImage("imgs/bg/bg_guide2.jpg"),
    fit: BoxFit.cover,)
    ),//覆盖
            child:
              buildAll()
        ),
      ),
    );

  }



}

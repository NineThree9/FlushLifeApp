import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health/routes/Information/page/welcome_page.dart';

import 'MyFunction/FeedBack.dart';
import 'MyFunction/FindBackPassword.dart';
import 'Total.dart';
import 'package:http/http.dart' as http;
import 'introduction_animation/introduction_animation_screen.dart';
// import 'menu_item.dart';
// import 'contact_item.dart';

// void main() => runApp(Person());
class Person extends StatelessWidget {
  // This widget is the root of your application.
  final userid;

  const Person(this.userid);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home:MyPersonPage(context,userid)
    );
  }
}

//窗口入口
class MyPersonPage extends StatefulWidget {

  var parentContext;
  final userid;
  MyPersonPage(this.parentContext,this.userid,{Key key}) : super(key: key);

  @override
  _MyPersonPage createState() {
    return _MyPersonPage(this.userid);
  }
}


//个人基本属性
class ContactItem extends StatelessWidget {
  ContactItem({Key key, this.count, this.title, this.onPressed})
      : super(key: key);
  final String count;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: [
          new Padding(
            padding: const EdgeInsets.only(
              bottom: 4.0,
            ),
            child: new Text(count, style: new TextStyle(fontSize: 18.0)),
          ),
          new Text(title,
              style: new TextStyle(color: Colors.black54, fontSize: 14.0)),
        ],
      ),
    );
  }
}


//功能栏
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  MenuItem({Key key, this.icon, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new GestureDetector(
      onTap:onPressed,
      child:  new Column(
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                top: 12.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: new Row(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                    child:new Icon(
                      icon,
                      color: Colors.black54,
                    ),
                  ),
                  new Expanded(
                      child: new Text(
                        title,
                        style: new TextStyle(color: Colors.black54,fontSize: 16.0),
                      )
                  ),
                  new Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  )
                ],
              )
          ),
          new Padding(padding: const EdgeInsets.only(left: 20.0,right: 20.0),
            child: new Divider(
              color: Colors.black54,
            ),
          )

        ],
      ),
    );

  }
}



//个人界面主体程序
class _MyPersonPage extends State<MyPersonPage> {
  final userid;

  final double _appBarHeight = 180.0;
  String _userHead =
      'https://pic.616pic.com/ys_img/00/03/79/6pxmNeU4FS.jpg';
  String _username="请登录FlushLife";
  var feeltimes="0";
  var breathetimes="0";
  var spendtimes="0";
  var picture=new NetworkImage("https://pic.616pic.com/ys_img/00/03/79/6pxmNeU4FS.jpg");
  var _futureBuilderFuture;
  _MyPersonPage(this.userid);
  @override
  void initState() {
    super.initState();
    _futureBuilderFuture = getDatas();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getDatas() async {
    return Future.wait([fetchPost(),fetchPost2()]);
  }
  Future<String> fetchPost() async {
    if(userid!=null){
      final url = Uri.parse('http://114.132.183.187:9091/getUser');
      final response = await http.post(url,
          body: {'id': userid.toString()})
          .catchError((error) {
        print('$error错误');
      });
      final Map<String, dynamic> responseData = json.decode(response.body);
      // print(responseData["data"]);
      //处理响应数据
      if (responseData["code"]==200){
        _userHead=responseData["data"]["userpicture"];
        _username="你好！ "+responseData["data"]["username"];
        picture=new NetworkImage(_userHead);
      }
      else if (responseData["code"]==0){
        showConfirmDialog(context, '信息加载错误，这可能是我们的问题，请稍后重新登录。', () {
          // Navigator.pop(context);
          // 执行确定操作后的逻辑
        });
      }
    }
    return "1";
  }

  Future<String> fetchPost2() async {
    if (userid != null) {
      final url2 = Uri.parse('http://114.132.183.187:9091/getUserstate');

      final response = await http.post(url2,
          body: {'id': userid.toString()})
          .catchError((error) {
        print('$error错误');
      });
      final Map<String, dynamic> responseData = json.decode(response.body);

      //处理响应数据
      if (responseData["code"] == 200) {
        feeltimes = responseData["data"]["feeltimes"].toString();
        breathetimes = responseData["data"]["breathetimes"].toString();
        var enrolltimes=responseData["data"]["enrolltime"].toString();
        var t=DateTime.parse(enrolltimes) ;
        DateTime dateTime= DateTime.now();
        spendtimes=dateTime.difference(t).inDays.toString();
      }
    }
    return "1";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      // backgroundColor: new Color.fromARGB(175,240, 173,160),
      body:
        FutureBuilder(
            future: _futureBuilderFuture,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              print('connectionState:${snapShot.connectionState}');
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              } else {
                print(snapShot.hasError);
                print('data:${snapShot.data}');
                if (snapShot.hasError) {
                  return Text('Error: ${snapShot.error}');
                }
                print(picture.url);
                return new CustomScrollView(

                  slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            backgroundColor: new Color.fromARGB(255,240, 173,160),
            flexibleSpace: new FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x00000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Expanded(
                        flex: 3,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Padding(
                              padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 30.0,
                                bottom: 15.0,
                              ),
                              child: new Text(
                                _username,
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(
                                left: 30.0,
                              ),
                              child: new Text(
                                '清洗内心的污秽，重新出发',
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            right: 30.0,
                          ),
                          child: new CircleAvatar(
                            radius: 35.0,
                            backgroundImage: picture,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          new SliverList(

            delegate: new SliverChildListDelegate(
              <Widget>[
                new Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.none,
                      image: AssetImage("imgs/bg/bg_guide.jpg"),
                    ),
                  ),
                  // color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child:
                      new Column(
                        children:
                      [
                        new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                  new ContactItem(
                                  count: spendtimes+'天',
                                  title: '使用天数',
                                  ),
                                  new ContactItem(
                                  count: feeltimes+'次',
                                  title: '感受记录',
                                  ),
                                  new ContactItem(
                                  count: breathetimes+'次',
                                  title: '呼吸训练',
                                  ),
                              ]
                        ),
                      //   new Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //       new ContactItem(
                      //       count: spendtimes+'天',
                      //       title: '聆听白噪音',
                      //       ),
                      //       new ContactItem(
                      //       count: feeltimes+'次',
                      //       title: '学习冥想',
                      //       ),]
                      //   )
                      ]
                      ),

                  ),
                ),
                new Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("imgs/bg/bg_guide.jpg"),
                      ),
                    ),
                    // color: Colors.white,
                    //
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(

                    )
                ),
                new Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("imgs/bg/bg_guide.jpg"),
                      ),
                    ),
                    // color: Colors.white,
                    //
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(

                    )
                ),
                new Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("imgs/bg/bg_guide.jpg"),
                  ),
                  ),
                  // color: Colors.white,
                  //
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(

                  )
                ),
                new Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("imgs/bg/bg_guide.jpg"),
                    ),
                  ),
                  // color: Colors.white,
                  //
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      new MenuItem(
                        icon: Icons.print,
                        title: '账号',
                        onPressed: (){
                          Navigator.push(widget.parentContext,
                              MaterialPageRoute(builder: (context) => WelcomePage(widget.parentContext)));
                        },
                      ),
                      //todo
                      new MenuItem(
                          icon: Icons.face,
                          title: '找回密码',
                          onPressed: () {
                            // Navigator.of(context).push(PageRouteBuilder(
                            //     pageBuilder: (BuildContext context, Animation animation,
                            //         Animation secondaryAnimation) {
                            //       return LoginPage(this.context);
                            //     },
                            //     settings: RouteSettings()));
                            Navigator.push(widget.parentContext,
                                MaterialPageRoute(builder: (context) => FindBackPage(widget.parentContext)));
                          }
                      ),
                      ///更换头像
                      //todo
                      new MenuItem(
                        icon: Icons.print,
                        title: '更换头像',
                        onPressed: (){

                        },
                      ),
                      ///反馈意见
                      //todo
                      new MenuItem(
                          icon: Icons.document_scanner,
                          title: '反馈',
                          onPressed: () {
                            // Navigator.of(context).push(PageRouteBuilder(
                            //     pageBuilder: (BuildContext context, Animation animation,
                            //         Animation secondaryAnimation) {
                            //       return LoginPage(this.context);
                            //     },
                            //     settings: RouteSettings()));
                            Navigator.push(widget.parentContext,
                                MaterialPageRoute(builder: (context) => FeedBackPage(widget.parentContext)));
                          }
                      ),
                      ///退出账号
                      new MenuItem(
                        icon: Icons.print,
                        title: '退出账号',
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(widget.parentContext,
                            MaterialPageRoute(builder: (context) =>  MyApp(null)),
                                (route) => false,
                          );
                          },
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )
        ],
                );
              }
              },
        )
    );
  }
}

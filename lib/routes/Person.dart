import 'package:flutter/material.dart';

import 'introduction_animation/introduction_animation_screen.dart';
// import 'menu_item.dart';
// import 'contact_item.dart';

void main() => runApp(Person());
class Person extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home:MyPersonPage()
    );
  }
}

//窗口入口
class MyPersonPage extends StatefulWidget {

  MyPersonPage({Key key}) : super(key: key);

  @override
  _MyPersonPage createState() {
    return _MyPersonPage();
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



//个人界面主题程序
class _MyPersonPage extends State<MyPersonPage> {
  final double _appBarHeight = 180.0;
  final String _userHead =
      'https://pic.616pic.com/ys_img/00/03/79/6pxmNeU4FS.jpg';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      // backgroundColor: new Color.fromARGB(175,240, 173,160),
      body: new CustomScrollView(
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
                                '登录FlushLife',
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
                                '清洗内省的污秽，重新出发',
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
                            backgroundImage: new NetworkImage(_userHead),
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
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        new ContactItem(
                          count: '0天',
                          title: '使用天数',
                        ),
                        new ContactItem(
                          count: '0次',
                          title: '感受记录',
                        ),
                        new ContactItem(
                          count: '0次',
                          title: '呼吸训练',
                        ),

                      ],
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
                    children: <Widget>[
                      new MenuItem(
                        icon: Icons.face,
                        title: '登录',
                        onPressed: () {
                          print("test");
                          Navigator.push(context, MaterialPageRoute(builder: (
                              _) {
                            // 目标页面，即一个 Widget
                            return IntroductionAnimationScreen();
                          }));
                        }
                      ),
                      new MenuItem(
                        icon: Icons.print,
                        title: '注册账户',
                        onPressed: (){

                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

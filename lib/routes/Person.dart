import 'package:flutter/material.dart';
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
        home:MyHomePage()
    );
  }
}


/***
 *  创建人：xuqing
 *  创建时间：2020年2月5日18:30:50
 *  类说明：横向布局的  封装
 */
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


/**
 * 创建人：xuqing
 * 创建时间 ：2020年2月4日21:39:42
 *
 */
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  MenuItem({Key key, this.icon, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new GestureDetector(
      onTap: onPressed,
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


class MyHomePage extends StatefulWidget {

  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}
class _MyHomePageState extends State<MyHomePage> {
  final double _appBarHeight = 180.0;
  final String _userHead =
      'https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg';
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
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
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
                                'Rei Ki',
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(
                                left: 30.0,
                              ),
                              child: new Text(
                                '在职-不考虑机会',
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
                  color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        new ContactItem(
                          count: '696',
                          title: '沟通过',
                        ),
                        new ContactItem(
                          count: '0',
                          title: '面试',
                        ),
                        new ContactItem(
                          count: '71',
                          title: '已投递',
                        ),
                        new ContactItem(
                          count: '53',
                          title: '感兴趣',
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      new MenuItem(
                        icon: Icons.face,
                        title: '体验新版本',
                        onPressed: (){
                          print("体验新版本  ----   >");
                        },
                      ),
                      new MenuItem(
                        icon: Icons.print,
                        title: '我的微简历',
                      ),
                      new MenuItem(
                        icon: Icons.archive,
                        title: '附件简历',
                      ),
                      new MenuItem(
                        icon: Icons.home,
                        title: '管理求职意向',
                      ),
                      new MenuItem(
                        icon: Icons.title,
                        title: '提升简历排名',
                      ),
                      new MenuItem(
                        icon: Icons.chat,
                        title: '牛人问答',
                      ),
                      new MenuItem(
                        icon: Icons.assessment,
                        title: '关注公司',
                      ),
                      new MenuItem(
                        icon: Icons.add_shopping_cart,
                        title: '钱包',
                      ),
                      new MenuItem(
                        icon: Icons.security,
                        title: '隐私设置',
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
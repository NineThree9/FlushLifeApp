import 'package:flutter/material.dart';
import 'package:health/routes/Information/page/enroll_page.dart';
import 'package:health/routes/information/page/login_page.dart';
import 'package:health/routes/information/theme/app_colors.dart';
import 'package:health/routes/information/welcome_widget.dart';

// 欢迎页面
class WelcomePage extends StatefulWidget {
  var parentcontext;
  WelcomePage(this.parentcontext,{Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          WelcomeHeaderWidget(),
          GradientBtnWidget(
            width: 208,
            child: BtnTextWhiteWidget(
              text: 'Enroll',
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return EnrollPage();
                },
              ));
            },
          ),
          SizedBox(height: 16),
          GestureDetector(
            child: LoginBtnWidget(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage(widget.parentcontext);
                },
              ));
            },
          ),
          SizedBox(height: 16),
          RightView(title: "忘记密码?",
            rightClick: () {
              showConfirmDialog(context, '请前往个人中心找回密码', () {
                // print('点击了确定删除......');
                // 执行确定操作后的逻辑
              });
            },),
          // Text(
          //   '忘记密码?',
          //   style: TextStyle(
          //     fontSize: 18,
          //     color: kTextColor,
          //   ),
          //
          // ),
          SizedBox(height: 54),
          Row(
            children: [
              Spacer(),
              LineWidget(),
              Text(
                'Power by Flushlife',
              ),
              // LoginTypeIconWidget(icon: 'assets/icons/logo_ins.png'),
              // LoginTypeIconWidget(icon: 'assets/icons/logo_fb.png'),
              // LoginTypeIconWidget(icon: 'assets/icons/logo_twitter.png'),
              LineWidget(),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
class RightView extends StatelessWidget {
  String title;
  VoidCallback rightClick;

  RightView({this.title, this.rightClick});

  @override
  Widget build(BuildContext context) {
    var containView;
    if (title != Null) {
      containView = new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          child: Text(
            this.title,
            style: TextStyle(color: kTextColor, fontSize: 18.0),
          ),
          onTap: this.rightClick,
        ),
      );
    } else {
      containView = Text("");
    }
    return containView;
  }
}
void showConfirmDialog(BuildContext context,String content, Function confirmCallback) {
  showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          title: new Text("提示"),
          content: new Text(content),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                confirmCallback();
                Navigator.of(context).pop();
              },
              child: new Text("确认"),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("取消"),
            ),
          ],
        );
      });
}

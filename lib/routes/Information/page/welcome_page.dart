import 'package:flutter/material.dart';
import 'package:health/routes/information/page/login_page.dart';
import 'package:health/routes/information/theme/app_colors.dart';
import 'package:health/routes/information/welcome_widget.dart';

// 欢迎页面
class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

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
                  return LoginPage();
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
                  return LoginPage();
                },
              ));
            },
          ),
          SizedBox(height: 16),
          Text(
            '忘记密码?',
            style: TextStyle(
              fontSize: 18,
              color: kTextColor,
            ),
          ),
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

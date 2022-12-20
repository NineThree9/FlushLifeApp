import 'package:flutter/material.dart';
import 'package:health/routes/information/theme/app_style.dart';


import '../enroll_widget.dart';

/// 注册页面
class EnrollPage extends StatefulWidget {
  EnrollPage({Key key}) : super(key: key);

  @override
  _EnrollPageState createState() => _EnrollPageState();
}

class _EnrollPageState extends State<EnrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('imgs/meditation/2.png'),
          Column(
            children: [
              SizedBox(height: 200),
              // Spacer(),
              ClipPath(
                clipper: EnrollClipper(),
                child: EnrollBodyWidget(),
              ),
              // SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
            ],
          ),
          Positioned(
            top: 64,
            left: 28,
            child: BackIcon(),
          )
        ],
      ),
    );
  }
}

/// 登录页面内容体
class EnrollBodyWidget extends StatelessWidget {
  const EnrollBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      padding: EdgeInsets.all(32),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26),
          Text(
            'Enroll',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 20),
          Text(
            'Your Email',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          EnrollInput(
            hintText: 'Email',
            prefixIcon: 'assets/icons/icon_email.png',
          ),
          SizedBox(height: 16),
          Text(
            'Your name',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          EnrollInput(
            hintText: 'User Name',
            prefixIcon: 'assets/icons/icon_email.png',
          ),
          SizedBox(height: 16),
          Text(
            'Your Password',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          EnrollInput(
            hintText: 'Password',
            prefixIcon: 'assets/icons/icon_pwd.png',
            obscureText: true,
          ),
          SizedBox(height: 32),
          EnrollBtnIconWidget(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

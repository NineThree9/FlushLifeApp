import 'package:flutter/material.dart';
import 'package:health/routes/information/theme/app_style.dart';
import 'package:health/routes/information/login_widget.dart';

/// 登录页面
class LoginPage extends StatefulWidget {
  LoginPage(this.parentcontext);
  var parentcontext;


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  _LoginPageState(){

  }
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
              SizedBox(height: 300),
              // Spacer(),
              ClipPath(
                clipper: LoginClipper(),
                child: LoginBodyWidget(),
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
class LoginBodyWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginBodyWidget({
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
          SizedBox(height: 86),
          Text(
            'Login',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 20),
          Text(
            'Your Email',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Email',
            prefixIcon: 'assets/icons/icon_email.png',
            mycontroller:this.emailController,
          ),
          SizedBox(height: 16),
          Text(
            'Your Password',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Password',
            prefixIcon: 'assets/icons/icon_pwd.png',
            mycontroller:this.passwordController,
            obscureText: true,
          ),
          SizedBox(height: 32),
          LoginBtnIconWidget(loginemailController: this.emailController,loginpasswordController: this.passwordController),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

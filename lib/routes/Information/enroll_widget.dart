import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health/routes/information/theme/app_size.dart';
import 'package:health/routes/information/theme/app_style.dart';
import 'package:health/routes/information/welcome_widget.dart';
import 'package:http/http.dart' as http;
///登录页面剪裁曲线
class EnrollClipper extends CustomClipper<Path> {
  // 第一个点
  Point p1 = Point(0.0, 54.0);
  Point c1 = Point(20.0, 25.0);
  Point c2 = Point(81.0, -8.0);
  // 第二个点
  Point p2 = Point(160.0, 20.0);
  Point c3 = Point(216.0, 38.0);
  Point c4 = Point(280.0, 73.0);
  // 第三个点
  Point p3 = Point(280.0, 44.0);
  Point c5 = Point(280.0, -11.0);
  Point c6 = Point(330.0, 8.0);

  @override
  Path getClip(Size size) {
    // 第四个点
    Point p4 = Point(size.width, .0);

    Path path = Path();
    // 移动到第一个点
    path.moveTo(p1.x, p1.y);
    //第一阶段 三阶贝塞尔曲线
    path.cubicTo(c1.x, c1.y, c2.x, c2.y, p2.x, p2.y);
    //第二阶段 三阶贝塞尔曲线
    path.cubicTo(c3.x, c3.y, c4.x, c4.y, p3.x, p3.y);
    //第三阶段 三阶贝塞尔曲线
    path.cubicTo(c5.x, c5.y, c6.x, c6.y, p4.x, p4.y);
    // 连接到右下角
    path.lineTo(size.width, size.height);
    // 连接到左下角
    path.lineTo(0, size.height);
    //闭合
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this.hashCode != oldClipper.hashCode;
  }
}

/// 注册图标按钮
class EnrollBtnIconWidget extends StatelessWidget {
  EnrollBtnIconWidget({
    Key key,
    this.emailController, this.nameController, this.passwordController,

  }) : super(key: key);
  final emailController;
  final nameController;
  final passwordController;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GradientBtnWidget(
          width: 160,
          child: Row(
            children: [
              SizedBox(width: 34),
              BtnTextWhiteWidget(
                text: 'Enroll',
              ),
              Spacer(),
              Image.asset(
                'assets/icons/icon_arrow_right.png',
                width: kIconSize,
                height: kIconSize,
              ),
              SizedBox(width: 24),
            ],
          ),
          onTap: () {
            final url = Uri.parse('http://114.132.183.187:9091/enroll');
            http.post(url,
                body: {'useremail': this.emailController.text, 'username':this.nameController.text ,'userpassword':this.passwordController.text})
                .then((http.Response response) {
                  final Map<String, dynamic> responseData = json.decode(response.body);

                  //处理响应数据
                  if (responseData["code"]==200){
                    showConfirmDialog(context, '注册成功，请保存好账户数据。返回登录界面登录', () {
                      Navigator.pop(context);
                      // 执行确定操作后的逻辑
                    });
                  }
                  else if (responseData["code"]==0){
                    showConfirmDialog(context, '信息不完整。请重新填写', () {
                      // Navigator.pop(context);
                      // 执行确定操作后的逻辑
                    });
                  }
                  else if (responseData["code"]==100){
                    showConfirmDialog(context, '邮箱已被注册，请更换邮箱', () {
                      // Navigator.pop(context);
                      // 执行确定操作后的逻辑
                    });
                  }

            }).catchError((error) {
              print('$error错误');
            });

            // Navigator.pop(context);
          },
        )
      ],
    );
  }
}

///登录输入框
class EnrollInput extends StatelessWidget {
  EnrollInput({
    Key key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.mycontroller,
  }) : super(key: key);

  final String hintText;
  final String prefixIcon;
  final bool obscureText;
  final mycontroller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hintText,
        border: kInputBorder,
        focusedBorder: kInputBorder,
        enabledBorder: kInputBorder,
        prefixIcon: Container(
          width: kIconBoxSize,
          height: kIconBoxSize,
          alignment: Alignment.center,
          child: Image.asset(
            prefixIcon,
            width: kIconSize,
            height: kIconSize,
          ),
        ),
      ),
      obscuringCharacter: '*',
      obscureText: obscureText,
      style: kBodyTextStyle.copyWith(
        fontSize: 18,
      ),
    );
  }
}

/// 返回图标
class BackIcon extends StatelessWidget {
  const BackIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: kIconBoxSize,
        height: kIconBoxSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/icons/icon_back.png',
          width: kIconSize,
          height: kIconSize,
        ),
      ),
    );
  }
}

//注册对话框
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

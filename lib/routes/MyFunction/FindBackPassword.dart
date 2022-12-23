import 'dart:convert';

import 'package:flutter/material.dart';

import '../Information/enroll_widget.dart';
import '../Total.dart';
import 'package:http/http.dart' as http;

//找回密码
class FindBackPage extends StatefulWidget {

  static String tag = 'findback-page';
  var parentContext;

  FindBackPage(this.parentContext);
  @override
  _FindBackPageState createState() => new _FindBackPageState();
}

class _FindBackPageState extends State<FindBackPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final logo = Hero(//飞行动画
    //   tag: 'hero',
    //   child: CircleAvatar(//圆形图片组件
    //     backgroundColor: Colors.Black,//透明
    //     radius: 120.0,//半径
    //     child: Image.asset("imgs/sound/5_pale2.jpg"),//图片
    //   ),
    // );
    // final logo = Image.asset("imgs/sound/Aeolian.jpg");//图片

    final logo=Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "imgs/sound/Aeolian.jpg",
        width: double.maxFinite,
      ),
    );
    final username = TextFormField(//用户名
      controller:this.nameController,

      autofocus: false,//是否自动对焦
      decoration: InputDecoration(
          hintText: '请输入希望找回的用户名',//提示内容
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),//上下左右边距设置
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)//设置圆角大小
          )
      ),
    );

    final useremail= TextFormField(//密码
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      obscureText: false,
        controller:this.emailController,
      decoration: InputDecoration(
          hintText: '请输入希望找回的邮箱',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),//上下各添加16像素补白
      child: Material(
        borderRadius: BorderRadius.circular(30.0),// 圆角度
        shadowColor: Colors.lightBlueAccent.shade100,//阴影颜色
        elevation: 5.0,//浮动的距离
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            final url = Uri.parse('http://114.132.183.187:9091/findPassword');
            // print(this.loginemailController.text);
            // print(this.loginpasswordController.text);
            http.post(url,
                body: {'useremail': this.emailController.text,'username':this.nameController.text})
                .then((http.Response response) {
              final Map<String, dynamic> responseData = json.decode(response.body);
              //处理响应数据
              if (responseData["code"]==200){
                showConfirmDialog(context, '您的密码为'+responseData["data"], () {

                });
              }
              else if (responseData["code"]==0){
                showConfirmDialog(context, '咱不存在此用户，您可以选择注册', () {
                  // Navigator.pop(context);
                  // 执行确定操作后的逻辑
                });
              }


            }).catchError((error) {
              print('$error错误');
            });
            // Navigator.pushAndRemoveUntil(
            //   // widget.parentContext,
            //     // MaterialPageRoute(builder: (context) => MyHomePage()),
            //     //   (route) => false,
            //
            // );
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));

          },
          color: Color(0xFFF89500),//按钮颜色
          child: Text('找回', style: TextStyle(color: Colors.white, fontSize: 20.0),),
        ),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(//将这些组件全部放置在ListView中
          shrinkWrap: true,//内容适配
          padding: EdgeInsets.only(left: 24.0, right: 24.0),//左右填充24个像素块
          children: <Widget>[
            logo,
            SizedBox(height: 48.0,),//用来设置两个控件之间的间距
            username,
            SizedBox(height: 8.0,),
            useremail,
            SizedBox(height: 24.0,),
            loginButton,
          ],
        ),
      ),
    );
  }

}

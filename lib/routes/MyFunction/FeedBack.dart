import 'dart:convert';

import 'package:flutter/material.dart';

import '../Information/enroll_widget.dart';
import '../Total.dart';
import 'package:http/http.dart' as http;

//找回密码
class FeedBackPage extends StatefulWidget {

  static String tag = 'feedback-page';
  var parentContext;

  FeedBackPage(this.parentContext);
  @override
  _FindBackPageState createState() => new _FindBackPageState();
}

class _FindBackPageState extends State<FeedBackPage> {
  final textController = TextEditingController();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // final logo = Image.asset("imgs/sound/seria.jpg");//图片
    final logo=Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "imgs/sound/seria.jpg",
        width: double.maxFinite,
      ),
    );

    final username = TextFormField(//用户名
      controller:this.titleController,

      autofocus: false,//是否自动对焦
      decoration: InputDecoration(
          hintText: '请输入反馈标题',//提示内容
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),//上下左右边距设置
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)//设置圆角大小
          )
      ),
    );

    final useremail= TextFormField(//密码
      autofocus: false,
      obscureText: false,
      controller:this.textController,
      maxLines: 15,
      decoration: InputDecoration(
          hintText: '请输入反馈正文',

          // contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
          // contentPadding: EdgeInsets.fromLTRB(10.0,10.0, 10.0, 100.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );

    final sendButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),//上下各添加16像素补白
      child: Material(
        borderRadius: BorderRadius.circular(30.0),// 圆角度
        shadowColor: Colors.lightBlueAccent.shade100,//阴影颜色
        elevation: 5.0,//浮动的距离
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            final url = Uri.parse('http://114.132.183.187:9091/sendFeedBack');
            http.post(url,
                body: {'text': this.textController.text,'title':this.titleController.text})
                .then((http.Response response) {
              final Map<String, dynamic> responseData = json.decode(response.body);
              //处理响应数据
              if (responseData["code"]==200){
                showConfirmDialog(context, "您的反馈已提交，请关注后续软件更新", () {
                  Navigator.pop(context);
                });
              }
              else {
                showConfirmDialog(context, '暂时提交失败，请稍后重试', () {
                  // Navigator.pop(context);
                  // 执行确定操作后的逻辑
                });
              }


            }).catchError((error) {
              print('$error错误');
            });

          },
          color: Color(0xFFF89500),//按钮颜色
          child: Text('提交', style: TextStyle(color: Colors.white, fontSize: 20.0),),
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
            SizedBox(height: 20.0,),//用来设置两个控件之间的间距
            username,
            SizedBox(height: 8.0,),
            useremail,
            SizedBox(height: 24.0,),
            sendButton,
          ],
        ),
      ),
    );
  }

}

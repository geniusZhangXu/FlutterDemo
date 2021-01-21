import 'dart:ffi';

import 'package:flutter/material.dart';

class MineCustomButton extends StatefulWidget {
  MineCustomButton({Key key}) : super(key: key);

  ///
  @override
  _MineCustomButton createState() => _MineCustomButton();
}

class _MineCustomButton extends State<MineCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮学习", style: TextStyle(fontSize: 16)),
      ),

      /// 视图内容
      body: Column(
        children: [
          /// 凸起的按钮
          RaisedButton(
            child: Text("开心按钮"),
            onPressed: _raisedButtonClickEvent,
          ),

          /// 扁平化的按钮
          FlatButton(onPressed: _flatButtonClickEvent, child: Text("开心按钮 2")),

          /// 默认带有一个边框，我们可以通过属性指定正常状态，跟用户点击状态下的边框颜色。
          OutlineButton(
              onPressed: _flatButtonClickEvent, child: Text("开心按钮 3")),

          ///
          FlatButton(
            color: Colors.orange,
            highlightColor: Colors.blue,
            child: Text("开心按钮 4"),
            colorBrightness: Brightness.dark,
            splashColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: _flatButtonClickEvent,
          ),

          /// 自定义按钮
          FlatButton(
              onPressed: _flatButtonClickEvent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.label_important_outlined), Text("喜欢你")],
              ))
        ],
      ),
    );
  }

  ///
  void _raisedButtonClickEvent() {
    print("_raisedButtonClickEvent");
  }

  ///
  void _flatButtonClickEvent() {
    print("_flatButtonClickEvent");
  }
}

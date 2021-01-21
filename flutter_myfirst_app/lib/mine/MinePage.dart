import 'package:flutter/material.dart';
import 'package:flutter_myfirst_app/mine/MineCustomButton.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("我的"),
        backgroundColor: Colors.orange,
        elevation: 0, // 去掉Appbar底部阴影
      ),
      body: ListView(
        children: <Widget>[
          /// 头部的View
          MineHeader("images/icon_header.png", "张旭旭旭旭啊"),

          /// 线
          _listViewLine,
          MineItemWidget("images/icon_heath.png", "我的健康", onTap: () {
            /// 跳转到查看按钮内容界面
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MineCustomButton()),
            );
          }),
          MineItemWidget("images/icon_village.png", "我的旅行", onTap: () {
            print('我的旅行');
          }),
          _listViewLine,
          MineItemWidget("images/mine_train.png", "我的家乡", onTap: () {
            print('我的家乡');
          }),
        ],
      ),
    );
  }

  /// 分割线
  Widget get _listViewLine {
    return Container(
      color: Color(0xffeaeaea),
      height: 6,
    );
  }
}

class MineHeader extends StatelessWidget {
  String userHeaderImage;
  String userName;

  /// 这里定义了就可以在外面使用这个方法进行初始化
  MineHeader(this.userHeaderImage, this.userName);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 100,

      /// 水平布局
      /// 在Row中使用Expanded的时候，无法指定Expanded中的子组件的宽度width，但可以指定其高度height。
      /// 同理，在Column中使用Expanded的时候，
      /// 无法指定Expanded中的子组件的高度height，可以指定宽度width。
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: Image.asset(
                userHeaderImage,
                width: 50,
                height: 50,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                userName,

                /// 18号 蓝色 加粗
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MineItemWidget extends StatelessWidget {
  String imageName;
  String title;

  @required
  VoidCallback onTap;

  MineItemWidget(this.imageName, this.title, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      /// 子视图 颜色容器
      child: Column(
        children: <Widget>[
          ///
          Container(
            height: 53,
            child: _mineItem(imageName, title),
          ),
          Container(
            color: Color(0xffeaeaea),
            constraints: BoxConstraints.expand(height: 1.0),
          ),
        ],
      ),
    );
  }

  Widget _mineItem(String imageName, String title) {
    return InkWell(
      onTap: () {
        this.onTap();
      },
      child: Row(
        ///
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: Image.asset(
                imageName,
                width: 20,
                height: 20,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

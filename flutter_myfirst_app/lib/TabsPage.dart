import 'package:flutter/material.dart';

/// 导入四个我们自己创建的文件
import 'home/HomePage.dart';
import 'around/AroundPage.dart';
import 'mine/MinePage.dart';
import 'service/ServicePage.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int currentIndex = 0;

  ///
  List listTabs = [
    HomePage(),
    AroundPage(),
    ServicePage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      body: this.listTabs[this.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.currentIndex,
        iconSize: 24.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '周边'),
          BottomNavigationBarItem(icon: Icon(Icons.send_rounded), label: '服务'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '我的'),
        ],

        /// 选中的颜色
        fixedColor: Colors.blue,
      ),
    );
  }
}

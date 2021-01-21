import 'package:flutter/material.dart';

/// 导入一个和自己平级的文件
import 'TabsPage.dart';

/// main函数使用了(=>)符号, 这是Dart中单行函数或方法的简写
void main() => runApp(MyApp());

/// 继承与StatelessWidget 这将会使应用本身也成为一个widget。
/// 在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)
/// 每次MaterialApp需要渲染时或者在Flutter Inspector中切换平台时 build 都会运行.
/// Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  @override
  /*
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // material是一种标准的移动端和web端的视觉设计语言
    // Flutter提供了一套丰富的 material widgets
    return MaterialApp(
      //
      title: 'Welcome to Flutter',

      /// Scaffold 是 Material library 中提供的一个widget,
      /// 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂
      /// widget的主要工作是提供一个build()方法来描述如何根据其他较低级别的widget来显示自己
      home: new Scaffold(
        /// 这个bar的作用相当于iOS中的导航
        appBar: new AppBar(
          title: new Text('首页'),
        ),

        /// 把它当成SwiftUI中的body去理解
        body: new Center(
          /// 子视图
          /// 本示例中的body的widget树中包含了一个Center widget, Center widget又包含一个 Text 子widget。
          /// Center widget 可以将其子widget树对其到屏幕中心
          /// child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),
      ),
    );
  }*/

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: TabsPage(),

      /// 改变导航主题的颜色
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),

      /// 列表视图
      /// home: new RandomWords(),
    );
  }
}

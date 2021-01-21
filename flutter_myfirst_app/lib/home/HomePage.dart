import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  ///
  @override
  _HomePageState createState() => _HomePageState();
}

/// 类将保存随着用户滚动而无限增长的生成的单词对，以及喜欢的单词对，用户通过重复点击心形
/// ❤️ 图标来将它们从列表中添加或删除。
class _HomePageState extends State<HomePage> {
  /// 在Dart语言中使用下划线前缀标识符，会强制其变成私有的
  final _suggestions = <WordPair>[];

  /// 喜欢的单次对 Set中不允许重复的值
  final _saved = new Set<WordPair>();

  /// text字体的大小
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    /// 包装导航
    return Scaffold(
      appBar: new AppBar(
        title: Text("首页"),
        actions: [
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),

      /// 首页内容
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(

        /// 加16像素的四边边距
        padding: const EdgeInsets.all(16),

        /// item
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2，这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // 对它的理解就像iOS中的cell一样
  Widget _buildRow(WordPair pair) {
    // 在 _buildRow 方法中添加 alreadySaved来检查确保单词对还没有添加到收藏夹中。
    final alreadySaved = _saved.contains(pair);

    ///
    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          /// 提示: 在Flutter的响应式风格的框架中，调用setState()
          /// 会为State对象触发build()方法，从而导致对UI的更新
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }

  // 跳转方法
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(pair.asPascalCase, style: _biggerFont),
              );
            },
          );

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('保存的单词'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

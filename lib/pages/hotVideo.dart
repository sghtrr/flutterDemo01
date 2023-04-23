import 'package:flutter/material.dart';

class HotVideoPage extends StatefulWidget {
  const HotVideoPage({super.key});

  @override
  State<HotVideoPage> createState() => _HotVideoPageState();
}

class _HotVideoPageState extends State<HotVideoPage> {
  final List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      _list.add(Center(
          child: Text("第${i + 1}个视频", style: const TextStyle(fontSize: 40))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("热门视频")),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: _list,
          onPageChanged: (index) {
            final tmpListLength = _list.length;
            if (index + 2 == tmpListLength) {
              for (var i = 0; i < 10; i++) {
                _list.add(Center(
                    child: Text("第${i + 1 + tmpListLength}个视频",
                        style: const TextStyle(fontSize: 40))));
              }
            }
          },
        ));
  }
}

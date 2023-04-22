import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  // 命名路由传值step3：需要接受传值的地方配置arguments参数，类型为Map
  final Map arguments;
  const MorePage({super.key, required this.arguments});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
      ),
      body: Center(
        child: widget.arguments["widget"],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

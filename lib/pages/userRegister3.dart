import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdemo01/pages/myscaffold.dart';

class UserRegisterPage3 extends StatefulWidget {
  const UserRegisterPage3({super.key});

  @override
  State<UserRegisterPage3> createState() => _UserRegisterPage3State();
}

class _UserRegisterPage3State extends State<UserRegisterPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Step3"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const ListTile(
            title: Center(child: Text("congratulations!")),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            const MyScaffold(index: 4)),
                    (route) => false);
              },
              child: const Text("finish"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UserRegisterPage1 extends StatefulWidget {
  const UserRegisterPage1({super.key});

  @override
  State<UserRegisterPage1> createState() => _UserRegisterPage1State();
}

class _UserRegisterPage1State extends State<UserRegisterPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Step1"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const ListTile(
            title: Center(child: InputChip(label: Text("Enter your account"))),
          ),
          const ListTile(
            title: Center(child: InputChip(label: Text("Enter your password"))),
          ),
          ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context,
                  "/userRegister2"), // 使用pushReplacementNamed来替换当前页面，达到返回时跳过此页面的效果
              child: const Text("Next...")),
        ],
      ),
    );
  }
}

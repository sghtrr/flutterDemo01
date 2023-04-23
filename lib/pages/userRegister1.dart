import 'package:flutter/material.dart';

class UserRegisterPage1 extends StatefulWidget {
  const UserRegisterPage1({super.key});

  @override
  State<UserRegisterPage1> createState() => _UserRegisterPage1State();
}

class _UserRegisterPage1State extends State<UserRegisterPage1> {
  void confirmAccountPasswordDialog() async {
    String result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("confirm message"),
          content: const Text("confirm your account and password"),
          actions: [buildTextButton("OK", "0"), buildTextButton("Cancel", "1")],
        );
      },
    );

    result == "0"
        ? Navigator.pushReplacementNamed(context, "/userRegister2")
        : null;
  }

  Widget buildTextButton(String text, String result) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(result),
      child: Text(text),
    );
  }

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
              onPressed:
                  confirmAccountPasswordDialog, // 使用pushReplacementNamed来替换当前页面，达到返回时跳过此页面的效果
              child: const Text("Next...")),
        ],
      ),
    );
  }
}

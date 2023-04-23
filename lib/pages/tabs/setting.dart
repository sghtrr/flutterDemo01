import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(height: 50),
        ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/userRegister1"),
            child: const Text("用户注册"))
      ],
    ));
  }
}

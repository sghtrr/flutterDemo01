import 'package:flutter/material.dart';

class UserRegisterPage2 extends StatefulWidget {
  const UserRegisterPage2({super.key});

  @override
  State<UserRegisterPage2> createState() => _UserRegisterPage2State();
}

class _UserRegisterPage2State extends State<UserRegisterPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Step2"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const ListTile(
            title:
                Center(child: InputChip(label: Text("Enter your phoneNumber"))),
          ),
          const ListTile(
            title: Center(
                child: InputChip(label: Text("Enter the code you received"))),
          ),
          ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, "/userRegister3"),
              child: const Text("Next..."))
        ],
      ),
    );
  }
}

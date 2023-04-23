import 'package:flutter/material.dart';

class UserRegisterPage2 extends StatefulWidget {
  const UserRegisterPage2({super.key});

  @override
  State<UserRegisterPage2> createState() => _UserRegisterPage2State();
}

class _UserRegisterPage2State extends State<UserRegisterPage2> {
  void confirmPhoneNumberDialog() async {
    String result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("confirm message"),
          content: const Text("confirm your phoneNumber"),
          actions: [buildTextButton("OK", "0"), buildTextButton("Cancel", "1")],
        );
      },
    );

    result == "0" ? Navigator.pushNamed(context, "/userRegister3") : null;
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
              onPressed: confirmPhoneNumberDialog, child: const Text("Next..."))
        ],
      ),
    );
  }
}

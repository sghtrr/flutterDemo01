import 'package:flutter/material.dart';
import 'pages/tabs/game.dart';
import 'pages/tabs/home.dart';
import 'pages/tabs/people.dart';
import 'pages/tabs/setting.dart';
import 'pages/tabs/message.dart';

void main() {
  runApp(const MaterialApp(home: Scoffold()));
}

class Scoffold extends StatefulWidget {
  const Scoffold({super.key});

  @override
  State<Scoffold> createState() => _ScoffoldState();
}

class _ScoffoldState extends State<Scoffold> {
  int _currentIndex = 0;
  final List<Widget> widgets = const [
    HomePage(),
    PeoplePage(),
    MessagePage(),
    GamePage(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter")),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.itying.com/images/flutter/5.png"),
                      fit: BoxFit.cover)),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://www.itying.com/images/flutter/2.png"),
              ),
              accountName: Text("yuyishan"),
              accountEmail: Text("123456789@qq.com"),
            ),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.message, size: 18)),
              title: const Text(
                "我的消息",
              ),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.shop_2, size: 18)),
              title: Text("商城"),
            ),
            const Divider(),
          ],
        ),
      ),
      body: widgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) => setState(() {
                _currentIndex = value;
              }),
          iconSize: 20,
          fixedColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: '联系人'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: '新建'),
            BottomNavigationBarItem(icon: Icon(Icons.games), label: '游戏'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
          ]),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2 ? Colors.green : Colors.blue,
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

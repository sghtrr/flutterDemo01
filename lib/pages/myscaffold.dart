import 'package:flutter/material.dart';
import './tabs/game.dart';
import './tabs/home.dart';
import './tabs/people.dart';
import './tabs/setting.dart';
import './tabs/message.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
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
      appBar: AppBar(
        title: const Text("Pets viewer"),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return const SearchPage();
                // }));
                Navigator.pushNamed(context, "/search");
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         const MorePage(Text("passed message... More"))));
                // 命名路由传值step4：调用路由的地方，如需参数，加上arguments，类型为键值对的Map
                Navigator.pushNamed(context, "/more",
                    arguments: {"widget": const Text("命名路由传值 more...")});
              },
              icon: const Icon(Icons.more_horiz)),
        ],
      ),
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
                  // _currentIndex = 2;
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

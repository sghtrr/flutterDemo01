import 'package:flutter/material.dart';
import '/tools/keepAliveWrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> imageList = [
    _imageFactory(src: "https://www.itying.com/images/flutter/1.png"),
    _imageFactory(src: "https://www.itying.com/images/flutter/2.png"),
    _imageFactory(src: "https://www.itying.com/images/flutter/3.png")
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        // 此判断可以防止点击tab时打印两次index
        print(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: SizedBox(
            height: 30,
            child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(fontSize: 14),
                tabs: const [
                  Tab(
                    child: Text("热门"),
                  ),
                  Tab(
                    child: Text("国内"),
                  ),
                  Tab(
                    child: Text("国外"),
                  ),
                  Tab(
                    child: Text("关注"),
                  ),
                  Tab(
                    child: Text("体育"),
                  ),
                  Tab(
                    child: Text("时尚"),
                  ),
                ]),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          KeepAliveWrapper(
              child: Column(
            children: [
              SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      PageView.builder(
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        key: const PageStorageKey('myPageView'),
                        // controller: PageController(viewportFraction: 0.8),
                        itemBuilder: (context, index) {
                          final int actualIndex = index % 3;
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Center(
                              child: imageList[actualIndex],
                            ),
                          );
                        },
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 2,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                imageList.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: CircleAvatar(
                                          radius: 4,
                                          backgroundColor:
                                              _currentIndex % 3 == index
                                                  ? Colors.blue
                                                  : Colors.grey),
                                    ))),
                      )
                    ],
                  )),
              const ListTile(title: Text("我是热门内容")),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed("/hotVideo"),
                  child: const Text("热门视频")),
            ],
          )),
          // 使用自定义的状态缓存组件来包裹Widget，可以在tab切换过程中保留原tab状态
          KeepAliveWrapper(
              child: ListView(children: const [
            ListTile(title: Text("我是国内内容1")),
            ListTile(title: Text("我是国内内容2")),
            ListTile(title: Text("我是国内内容3")),
            ListTile(title: Text("我是国内内容4")),
            ListTile(title: Text("我是国内内容5")),
            ListTile(title: Text("我是国内内容6")),
            ListTile(title: Text("我是国内内容7")),
            ListTile(title: Text("我是国内内容8")),
            ListTile(title: Text("我是国内内容9")),
            ListTile(title: Text("我是国内内容10")),
            ListTile(title: Text("我是国内内容11")),
            ListTile(title: Text("我是国内内容12")),
            ListTile(title: Text("我是国内内容13")),
            ListTile(title: Text("我是国内内容14")),
            ListTile(title: Text("我是国内内容15")),
            ListTile(title: Text("我是国内内容16")),
            ListTile(title: Text("我是国内内容17")),
            ListTile(title: Text("我是国内内容18")),
            ListTile(title: Text("我是国内内容19")),
            ListTile(title: Text("我是国内内容20")),
          ])),
          KeepAliveWrapper(
              child:
                  ListView(children: const [ListTile(title: Text("我是国外内容"))])),
          KeepAliveWrapper(
              child:
                  ListView(children: const [ListTile(title: Text("我是关注内容"))])),
          KeepAliveWrapper(
              child:
                  ListView(children: const [ListTile(title: Text("我是体育内容"))])),
          KeepAliveWrapper(
              child:
                  ListView(children: const [ListTile(title: Text("我是时尚内容"))])),
        ],
      ),
    );
  }

  static _imageFactory(
      {double height = 200,
      double width = double.infinity,
      required String src}) {
    return SizedBox(
        height: height,
        width: width,
        child: Image.network(
          src,
          fit: BoxFit.cover,
        ));
  }
}

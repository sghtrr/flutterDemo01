import 'package:flutter/material.dart';
import '../pages/search.dart';
import '../pages/more.dart';
import '../pages/myscaffold.dart';

// 命名路由传值step1：配置routes，有参数的需要加上命名参数{arguments}
Map routes = {
  "/": (context) => const MyScaffold(),
  "/search": (context) => const SearchPage(),
  "/more": (context, {arguments}) => MorePage(arguments: arguments)
};

// 命名路由传值step2：配置onGenerateRoute方法，写法基本固定，判断是否有参数，来调用路由
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (contetxt) =>
              pageContentBuilder(contetxt, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (contetxt) => pageContentBuilder(contetxt));
      return route;
    }
  }
  return null;
};

import 'package:flutter/material.dart';
import './routers/routers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // 去掉debug图标
    title: 'my flutter', // app在手机最近程序时显式的名字
    theme: ThemeData(primarySwatch: Colors.blue),
    initialRoute: "/",
    onGenerateRoute: onGenerateRoute,

    // home: const Scoffold()
  ));
}

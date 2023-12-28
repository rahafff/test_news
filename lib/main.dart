import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_news_app/view/last-news.dart';

main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "news App",
      home: LastNewsScreen(),
    );
  }
}

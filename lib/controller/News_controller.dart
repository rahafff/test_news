import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_news_app/model/nes_moel.dart';

class NewsController extends GetxController {

  String  searchKey1='Tesla';
  String  searchKey2='';

  TextEditingController searchKey1Controller = TextEditingController();
  TextEditingController searchKey2Controller = TextEditingController();

 Map<String ,List<Article> >  articlesWithTag = {};

  getData(String  searchKey ,String textTag) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchKey&sortBy=publishedAt&apiKey=7f01a1f8c35e43d89dd699dcf501cfea");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        Articles  articles = Articles.fromJson(jsonDecode(response.body));
        articlesWithTag.update(textTag, (value) => articles.articles ??[]);
      } catch (e) {
        Get.snackbar("error", e.toString());
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    searchKey1Controller.text = 'Tesla';
    getData(searchKey1,'textOne');
  }
}

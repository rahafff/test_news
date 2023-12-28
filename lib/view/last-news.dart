import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_news_app/controller/News_controller.dart';
import 'package:test_news_app/model/nes_moel.dart';

class LastNewsScreen extends StatelessWidget {
  const LastNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("news App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: controller.searchKey1Controller),
            TextField(controller: controller.searchKey2Controller),
            Expanded(
              child: FutureBuilder(
                  future: controller.getData('test'),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      Articles data = snapshot.data;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.articles?.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 10,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 150,
                                      child: Image.network(
                                        data.articles![index].urlToImage
                                            .toString(),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      data.articles![index].title.toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data.articles![index].description
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 8, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(
                          child: IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(Icons.refresh)));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var url = Uri.https("jsonplaceholder.typicode.com", "photos/$counter");
    var res = await get(url);
    var imageModel = ImageModel.fromJson(jsonDecode(res.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Let's see some images"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(
            Icons.add,
          ),
        ),
        body: ImageList(images),
      ),
    );
  }
}
//creating our own widget

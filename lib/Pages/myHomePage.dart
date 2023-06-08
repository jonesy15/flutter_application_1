// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Classes/post.dart';
import '../Widgets/postList.dart';
import '../Widgets/textInputWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageWidgetState createState() => MyHomePageWidgetState();
}

class MyHomePageWidgetState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String newText) {
    setState(() {
      // ignore: unnecessary_new
      var post = new Post(newText, "Neil");
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX'),
      ),
      body: Column(children: <Widget>[
        //expanded ensures everything within the child users as much as the available space as it can
        Expanded(
            child: PostList(
          listItems: posts,
        )),
        TextInputWidget(newPost),
      ]),
    );
  }
}

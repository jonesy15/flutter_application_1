// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../Classes/post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;
  const PostList({super.key, required this.listItems});
  @override
  PostListState createState() => PostListState();
}

class PostListState extends State<PostList> {
  void Like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text(post.body),
              subtitle: Text(post.author),
            )),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    post.likes.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.thumb_up_rounded),
                  onPressed: () => Like(post.likePost),
                  color: post.userLiked ? Colors.red : Colors.black,
                )
              ],
            )
          ]),
        );
      },
    );
  }
}

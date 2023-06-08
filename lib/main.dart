import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Post {
  //You are assuring flutter that you will initialize this in your code before its used.
  late String body;
  late String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    userLiked = !userLiked;
    if (userLiked) {
      likes += 1;
    } else {
      likes -= 1;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

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

class TextInputWidget extends StatefulWidget {
  final Function(String) textCallback;

  const TextInputWidget(this.textCallback, {super.key});

  @override
  TextInputWidgetState createState() => TextInputWidgetState();
}

class TextInputWidgetState extends State<TextInputWidget> {
  final controller =
      TextEditingController(); //allows us to attach to text field and get the contents

  @override
  void dispose() {
    super.dispose(); // calls paretnms dispose
    controller.dispose();
  }

  void onClick() {
    FocusScope.of(context).unfocus();
    widget.textCallback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: "Type a message:",
            prefixIcon: const Icon(Icons.message_rounded),
            suffixIcon: IconButton(
              onPressed: onClick,
              splashColor: Colors.blueAccent,
              tooltip: "Post Message",
              icon: const Icon(Icons.send),
            )));
  }
}

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

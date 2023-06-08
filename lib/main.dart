import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  String text = "";

  void changeText(String newText) {
    setState(() {
      text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX'),
      ),
      body: Column(children: <Widget>[TextInputWidget(changeText), Text(text)]),
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

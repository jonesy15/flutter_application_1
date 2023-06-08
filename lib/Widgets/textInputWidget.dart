// ignore_for_file: file_names

import 'package:flutter/material.dart';

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

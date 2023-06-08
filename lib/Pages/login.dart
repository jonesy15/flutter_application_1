import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/myHomePage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  late String newName;
  TextEditingController controller = TextEditingController();
  void onClick() {
    FocusScope.of(context).unfocus();
    newName = controller.text;
    controller.clear();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                  name: newName,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              labelText: "Type your name:",
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 5, color: Colors.black)),
              prefixIcon: const Icon(Icons.person_rounded),
              suffixIcon: IconButton(
                onPressed: onClick,
                splashColor: Colors.blueAccent,
                tooltip: "Submit",
                icon: const Icon(Icons.done_rounded),
              )),
        ),
      ),
    );
  }
}

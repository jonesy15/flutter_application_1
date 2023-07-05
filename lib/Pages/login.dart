import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fonts/custom_icons_icons.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: onClick,
                  splashColor: Colors.blueAccent,
                  tooltip: "Ships",
                  icon: const Icon(CustomIcons.ship),
                ),
                IconButton(
                  onPressed: onClick,
                  splashColor: Colors.blueAccent,
                  tooltip: "Rockets",
                  icon: const Icon(CustomIcons.rocket),
                ),
                IconButton(
                  onPressed: onClick,
                  splashColor: Colors.blueAccent,
                  tooltip: "Roadsters",
                  icon: const Icon(CustomIcons.car),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Ships',
                ),
                Text(
                  'Rockets',
                ),
                Text('Roadsters'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

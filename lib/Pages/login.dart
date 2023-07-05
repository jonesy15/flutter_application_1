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
  void onShipsClick() {
    FocusScope.of(context).unfocus();
    newName = controller.text;
    controller.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  void onRocketsClick() {
    FocusScope.of(context).unfocus();
    newName = controller.text;
    controller.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  void onRoadstersClick() {
    FocusScope.of(context).unfocus();
    newName = controller.text;
    controller.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: onShipsClick,
                  splashColor: Colors.blueAccent,
                  tooltip: "Ships",
                  icon: const Icon(CustomIcons.ship),
                ),
                IconButton(
                  onPressed: onRocketsClick,
                  splashColor: Colors.blueAccent,
                  tooltip: "Rockets",
                  icon: const Icon(CustomIcons.rocket),
                ),
                IconButton(
                  onPressed: onRoadstersClick,
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
                  '     Ships',
                  textAlign: TextAlign.center,
                ),
                Text(
                  '     Rockets',
                  textAlign: TextAlign.center,
                ),
                Text(
                  '   Roadsters',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

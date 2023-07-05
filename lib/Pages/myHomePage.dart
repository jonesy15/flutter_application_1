// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Classes/ships.dart';
import '../Classes/post.dart';
import '../Widgets/shipList.dart';
import '../Services/ShipService.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageWidgetState createState() => MyHomePageWidgetState();
}

class MyHomePageWidgetState extends State<MyHomePage> {
  List<Post> posts = [];
  late List<Ship>? ships = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    ships = (await ShipService().getAllShips())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ships'),
      ),
      body: ships == null || ships!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: <Widget>[
        //expanded ensures everything within the child users as much as the available space as it can
        Expanded(
            child: ShipList(
          listItems: ships,
        )),
      ]),
    );
  }
}

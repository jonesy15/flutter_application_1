// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Classes/ships.dart';
import '../Classes/post.dart';
import '../Widgets/postList.dart';
import '../Widgets/textInputWidget.dart';
import '../Services/ShipService.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  const MyHomePage({super.key, required this.name});

  @override
  MyHomePageWidgetState createState() => MyHomePageWidgetState();
}

class MyHomePageWidgetState extends State<MyHomePage> {

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
        title: const Text('Space-X Ships'),
      ),
      body: ships == null || ships!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: ships!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(ships![index].name.toString()),
                          Text(ships![index].shipClass.toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(ships![index].yearBuilt.toString()),
                          Text(ships![index].model.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

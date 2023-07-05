// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../Classes/ships.dart';

class ShipList extends StatefulWidget {
  final List<Ship>? listItems;
  const ShipList({super.key, required this.listItems});
  @override
  ShipListState createState() => ShipListState();
}

class ShipListState extends State<ShipList> {
  void Like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              itemCount: widget.listItems!.length,
              itemBuilder: (context, index) {
                var post = widget.listItems![index];
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(post.name.toString()),
                          Text(post.shipClass.toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(post.yearBuilt.toString()),
                          Text(post.model.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
  }
}

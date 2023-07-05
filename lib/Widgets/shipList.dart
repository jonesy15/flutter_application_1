// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import '../Classes/ships.dart';
import '../Fonts/custom_icons_icons.dart';

class ShipList extends StatefulWidget {
  final List<Ship>? listItems;
  const ShipList({super.key, required this.listItems});
  @override
  ShipListState createState() => ShipListState();
}

class ShipListState extends State<ShipList> {
  bool checkString(value) {
    if (['', null, 0, false].contains(value)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems!.length,
      itemBuilder: (context, index) {
        var ship = widget.listItems![index];
        var shipImage = ship.image ?? '';
        return Card(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  checkString(ship.image)
                      ? Image.network(
                          shipImage,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        )
                      : const Icon(CustomIcons.ship),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ship.name.toString(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ship.shipClass.toString(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        );
      },
    );
  }
}

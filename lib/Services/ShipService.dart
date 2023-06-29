import 'package:flutter_application_1/Classes/ships.dart';
import 'package:http/http.dart' as http;

class ShipService {
  var client = http.Client();
  Future<List<Ship>?> getAllShips() async {
    try {
      var uri = Uri.parse('https://api.spacexdata.com/v4/ships');
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        List<Ship> _ships = shipsFromJson(json);
        return _ships;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}

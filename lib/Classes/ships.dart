import 'dart:convert';

List<Ship> shipsFromJson(String str) =>
    List<Ship>.from(json.decode(str).map((x) => Ship.fromJson(x)));

String shipsToJson(List<Ship> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ship {
  String? lastAisUpdate;
  String? legacyId;
  String? model;
  String? type;
  List<String>? roles;
  int? imo;
  int? mmsi;
  int? abs;
  int? shipClass;
  int? massKg;
  int? massLbs;
  int? yearBuilt;
  String? homePort;
  String? status;
  int? speedKn;
  int? courseDeg;
  double? latitude;
  double? longitude;
  String? link;
  String? image;
  String? name;
  bool? active;
  List<String>? launches;
  String? id;

  Ship(
      {this.lastAisUpdate,
      this.legacyId,
      this.model,
      required this.type,
      this.roles,
      this.imo,
      this.mmsi,
      this.abs,
      this.shipClass,
      this.massKg,
      this.massLbs,
      this.yearBuilt,
      this.homePort,
      this.status,
      this.speedKn,
      this.courseDeg,
      this.latitude,
      this.longitude,
      this.link,
      this.image,
      required this.name,
      required this.active,
      this.launches,
      required this.id});

  factory Ship.fromJson(Map<String, dynamic> json) => Ship(
        lastAisUpdate: json['last_ais_update'],
        legacyId: json['legacy_id'],
        model: json['model'],
        type: json['type'],
        roles: json['roles'].cast<String>(),
        imo: json['imo'],
        mmsi: json['mmsi'],
        abs: json['abs'],
        shipClass: json['class'],
        massKg: json['mass_kg'],
        massLbs: json['mass_lbs'],
        yearBuilt: json['year_built'],
        homePort: json['home_port'],
        status: json['status'],
        speedKn: json['speed_kn'],
        courseDeg: json['course_deg'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        link: json['link'],
        image: json['image'],
        name: json['name'],
        active: json['active'],
        launches: json['launches'].cast<String>(),
        id: json['id'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_ais_update'] = this.lastAisUpdate;
    data['legacy_id'] = this.legacyId;
    data['model'] = this.model;
    data['type'] = this.type;
    data['roles'] = this.roles;
    data['imo'] = this.imo;
    data['mmsi'] = this.mmsi;
    data['abs'] = this.abs;
    data['class'] = this.shipClass;
    data['mass_kg'] = this.massKg;
    data['mass_lbs'] = this.massLbs;
    data['year_built'] = this.yearBuilt;
    data['home_port'] = this.homePort;
    data['status'] = this.status;
    data['speed_kn'] = this.speedKn;
    data['course_deg'] = this.courseDeg;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['link'] = this.link;
    data['image'] = this.image;
    data['name'] = this.name;
    data['active'] = this.active;
    data['launches'] = this.launches;
    data['id'] = this.id;
    return data;
  }
}

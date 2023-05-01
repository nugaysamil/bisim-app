// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  Network? network;

  UserModel({this.network});

  UserModel.fromJson(Map<String, dynamic> json) {
    network =
        json['network'] != null ? new Network.fromJson(json['network']) : null;
  }
}

class Network {
  List<String>? company;
  String? href;
  String? id;
  Location? location;
  String? name;
  List<Stations>? stations;

  Network({
    this.company,
    this.href,
    this.id,
    this.location,
    this.name,
    this.stations,
  });

  Network.fromJson(Map<String, dynamic> json) {
    company = json['company'].cast<String>();
    href = json['href'];
    id = json['id'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    name = json['name'];
    if (json['stations'] != null) {
      stations = <Stations>[];
      json['stations'].forEach((v) {
        stations!.add(new Stations.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'Network(company: $company, href: $href, id: $id, location: $location, name: $name, stations: $stations)';
  }
}

class Location {
  String? city;
  String? country;
  double? latitude;
  double? longitude;

  Location({this.city, this.country, this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  @override
  String toString() {
    return 'Location(city: $city, country: $country, latitude: $latitude, longitude: $longitude)';
  }
}

class Stations {
  int? emptySlots;
  Extra? extra;
  int? freeBikes;
  String? id;
  double? latitude;
  double? longitude;
  String? name;
  String? timestamp;

  Stations(
      {this.emptySlots,
      this.extra,
      this.freeBikes,
      this.id,
      this.latitude,
      this.longitude,
      this.name,
      this.timestamp});

  Stations.fromJson(Map<String, dynamic> json) {
    emptySlots = json['empty_slots'];
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
    freeBikes = json['free_bikes'];
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    timestamp = json['timestamp'];
  }

  @override
  String toString() {
    return 'Stations(emptySlots: $emptySlots, extra: $extra, freeBikes: $freeBikes, id: $id, latitude: $latitude, longitude: $longitude, name: $name, timestamp: $timestamp)';
  }
}

class Extra {
  int? slots;
  String? status;
  String? uid;

  Extra({this.slots, this.status, this.uid});

  Extra.fromJson(Map<String, dynamic> json) {
    slots = json['slots'];
    status = json['status'];
    uid = json['uid'];
  }

  @override
  String toString() => 'Extra(slots: $slots, status: $status, uid: $uid)';
}

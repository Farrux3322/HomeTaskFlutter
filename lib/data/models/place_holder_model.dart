class AirLineModel {
  final String id;
  final int id1;
  final String name;
  final String country;
  final String logo;
  final String slogan;
  final String head;
  final String website;
  final String established;

  AirLineModel(
      {required this.id,
        required this.id1,
        required this.name,
        required this.country,
        required this.logo,
        required this.slogan,
        required this.head,
        required this.website,
        required this.established});

  factory AirLineModel.fromJson(Map<String, dynamic> json) {
    return AirLineModel(
        id: json['_id'],
        id1: json['id'],
        name: json['name'],
        country: json['country'],
        logo: json['logo'],
        slogan: json['slogan'],
        head: json['head_quaters'],
        website: json['website'],
        established: json['established']);
  }
}


class DataModel {
  final String id;
  final String name;
  final int trips;
  final List<AirLineModel> airline;

  DataModel(
      {required this.id,
        required this.name,
        required this.trips,
        required this.airline});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      trips: json['trips'],
      airline: (json['airline'] as List<dynamic>?)
          ?.map((e) => AirLineModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],);
  }
}


class PassengerModel {
  final int totalPassenger;
  final int totalPages;
  final DataModel data;

  PassengerModel(
      {required this.totalPassenger,
        required this.totalPages,
        required this.data});

  factory PassengerModel.fromJson(Map<String, dynamic> json) {
    return PassengerModel(
        totalPassenger: json['totalPassengers'],
        totalPages: json['totalPages'],
        data: DataModel.fromJson(json['data']));
  }
}
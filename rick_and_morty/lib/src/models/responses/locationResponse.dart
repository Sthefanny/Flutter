import 'package:rick_and_morty/src/models/infoModel.dart';

class LocationResponse {
  final InfoModel info;
  final List<LocationResult> results;

  LocationResponse({
    this.info,
    this.results,
  });

  LocationResponse.fromJson(Map<String, dynamic> json)
      : info = InfoModel.fromJson(json['info']),
        results = (json['results'] as List<dynamic>).map((value) => LocationResult.fromJson(value)).toList();
}

class LocationResult {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<dynamic> residents;
  final String url;
  final String created;

  LocationResult({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  LocationResult.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        type = json['type'],
        dimension = json['dimension'],
        residents = json['residents'],
        url = json['url'],
        created = json['created'];
}

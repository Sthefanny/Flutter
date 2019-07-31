import 'package:rick_and_morty/src/models/infoModel.dart';

import '../nameUrlModel.dart';

class CharacterResponse {
  final InfoModel info;
  final List<CharacterResult> results;

  CharacterResponse({
    this.info,
    this.results,
  });

  CharacterResponse.fromJson(Map<String, dynamic> json)
      : info = InfoModel.fromJson(json['info']),
        results = (json['results'] as List<dynamic>).map((value) => CharacterResult.fromJson(value)).toList();
}

class CharacterResult {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final NameUrlModel origin;
  final NameUrlModel location;
  final String image;
  final List<dynamic> episodes;
  final String url;
  final String created;

  CharacterResult({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episodes,
    this.url,
    this.created,
  });

  CharacterResult.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        type = json['type'],
        gender = json['gender'],
        origin = NameUrlModel.fromJson(json['origin']),
        location = NameUrlModel.fromJson(json['location']),
        image = json['image'],
        episodes = json['episodes'],
        url = json['url'],
        created = json['created'];
}

import 'package:rick_and_morty/src/models/infoModel.dart';

class EpisodeResponse {
  final InfoModel info;
  final List<EpisodeResult> results;

  EpisodeResponse({
    this.info,
    this.results,
  });

  EpisodeResponse.fromJson(Map<String, dynamic> json)
      : info = InfoModel.fromJson(json['info']),
        results = (json['results'] as List<dynamic>).map((value) => EpisodeResult.fromJson(value)).toList();
}

class EpisodeResult {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<dynamic> characters;
  final String url;
  final String created;

  EpisodeResult({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  EpisodeResult.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        airDate = json['air_date'],
        episode = json['episode'],
        characters = json['characters'],
        url = json['url'],
        created = json['created'];
}

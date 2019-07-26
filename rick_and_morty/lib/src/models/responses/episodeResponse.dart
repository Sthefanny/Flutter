class EpisodeResponse {
  final EpisodeInfo info;
  final EpisodeResult results;

  EpisodeResponse({
    this.info,
    this.results,
  });

  EpisodeResponse.fromJson(Map<String, dynamic> json)
      : info = json['info'],
        results = json['results'];
}

class EpisodeInfo {
  final int count;
  final int pages;
  final String next;
  final String prev;

  EpisodeInfo({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  EpisodeInfo.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        pages = json['pages'],
        pages = json['next'],
        pages = json['prev'];
}

class EpisodeResult {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
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
        airDate = json['air-date'],
        episode = json['episode'],
        characters = json['characters'],
        url = json['url'],
        created = json['created'];
}
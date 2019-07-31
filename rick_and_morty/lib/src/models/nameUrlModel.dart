class NameUrlModel {
  final String name;
  final String url;

  NameUrlModel({
    this.name,
    this.url,
  });

  NameUrlModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];
}

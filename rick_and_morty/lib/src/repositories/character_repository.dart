import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' show Client;
import 'package:rick_and_morty/src/configs/appConfig.dart';
import 'package:rick_and_morty/src/models/responses/characterResponse.dart';

class CharacterRepository extends Disposable {
  Client _client = Client();

  final _url = '${AppConfig.baseUrl}/character';

  Future<CharacterResponse> getCharacters() async {
    try {
      var response = await _client.get(_url);
      print('URL = $_url');
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        return CharacterResponse.fromJson(responseBody);
      }
    } catch (e) {
      throw new Exception(e.message);
    }
    throw new Exception('Ocorreu um problema ao tentar acessar a API');
  }

  @override
  void dispose() {}
}

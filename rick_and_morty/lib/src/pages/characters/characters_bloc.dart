import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rick_and_morty/src/models/responses/characterResponse.dart';
import 'package:rick_and_morty/src/repositories/character_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'characters_module.dart';

class CharactersBloc extends BlocBase {
  final CharacterRepository _repository = CharactersModule.to.getDependency<CharacterRepository>();

  final _characterController = BehaviorSubject<CharacterResponse>();

  Stream<CharacterResponse> get characters => _characterController.stream;

  Function(CharacterResponse) get changeCharacters => _characterController.sink.add;

  addCharacters() async {
    try {
      var response = await _repository.getCharacters();
      changeCharacters(response);
    } catch (e) {
      throw new Exception(e.message);
    }
  }

  @override
  void dispose() {
    _characterController.close();
    super.dispose();
  }
}

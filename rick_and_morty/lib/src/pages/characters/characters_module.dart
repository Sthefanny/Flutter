import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/repositories/character_repository.dart';

import 'characters_bloc.dart';
import 'characters_page.dart';

class CharactersModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CharactersBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => CharacterRepository()),
      ];

  @override
  Widget get view => CharactersPage();

  static Inject get to => Inject<CharactersModule>.of();
}

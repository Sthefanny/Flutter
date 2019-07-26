import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/repositories/episode_repository.dart';

import 'episodes_bloc.dart';
import 'episodes_page.dart';

class EpisodesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => EpisodesBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => EpisodeRepository()),
      ];

  @override
  Widget get view => EpisodesPage();

  static Inject get to => Inject<EpisodesModule>.of();
}

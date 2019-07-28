import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/repositories/location_repository.dart';

import 'locations_bloc.dart';
import 'locations_page.dart';

class LocationsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LocationsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LocationRepository()),
      ];

  @override
  Widget get view => LocationsPage();

  static Inject get to => Inject<LocationsModule>.of();
}

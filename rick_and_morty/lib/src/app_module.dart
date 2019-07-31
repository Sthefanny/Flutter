import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/app_widget.dart';
import 'package:rick_and_morty/src/app_bloc.dart';

import 'common/bottom_navbar_bloc.dart';
import 'pages/home/home_bloc.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
        Bloc((i) => AppBloc()),
        Bloc((i) => NavbarItemBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

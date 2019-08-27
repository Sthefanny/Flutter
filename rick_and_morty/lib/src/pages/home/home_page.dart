import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/app_module.dart';
import 'package:rick_and_morty/src/common/bottom_navbar_widget.dart';
import 'package:rick_and_morty/src/pages/characters/characters_module.dart';
import 'package:rick_and_morty/src/pages/episodes/episodes_module.dart';
import 'package:rick_and_morty/src/pages/home/home_bloc.dart';
import 'package:rick_and_morty/src/pages/locations/locations_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = AppModule.to.getBloc<HomeBloc>();
  var pages = [EpisodesModule(), CharactersModule(), LocationsModule()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty"),
      ),
      body: StreamBuilder<NavBarItem>(
        stream: _bloc.itemStream,
        initialData: _bloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) {
            case NavBarItem.EPISODES:
              return EpisodesModule();
            case NavBarItem.LOCATION:
              return LocationsModule();
            case NavBarItem.CHARACTERS:
            default:
              return CharactersModule();
          }
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bloc.itemStream,
        initialData: _bloc.defaultItem,
        builder: (context, snapshot) {
          return BubbleBottomBar(
            opacity: .2,
            currentIndex: snapshot.data.index,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            elevation: 8,
            hasInk: true,
            onTap: _bloc.pickItem,
            items: BottomNavbarWidget().build(),
          );
        },
      ),
    );
  }
}

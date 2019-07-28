import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/app_module.dart';
import 'package:rick_and_morty/src/common/progress_widget.dart';
import 'package:rick_and_morty/src/pages/characters/characters_module.dart';
import 'package:rick_and_morty/src/pages/episodes/episodes_module.dart';
import 'package:rick_and_morty/src/pages/home/home_bloc.dart';
import 'package:rick_and_morty/src/pages/locations/locations_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc = AppModule.to.getBloc<HomeBloc>();
  var pages = [EpisodesModule(), CharactersModule(), LocationsModule()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty"),
      ),
      body: StreamBuilder(
        stream: bloc.page,
        initialData: pages[0],
        builder: (context, snapshot) {
          if (!snapshot.hasData) return ProgressWidget();

          return snapshot.data;
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: bloc.pageIndex,
        builder: (context, snapshot) {
          return BubbleBottomBar(
            opacity: .2,
            currentIndex: snapshot.data,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            elevation: 8,
            hasInk: true,
            onTap: (index) {
              bloc.changePageIndex(index);
              bloc.changePage(pages[index]);
            },
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: Colors.red,
                  icon: Icon(Icons.dashboard, color: Colors.black),
                  activeIcon: Icon(
                    Icons.dashboard,
                    color: Colors.red,
                  ),
                  title: Text("Episodes")),
              BubbleBottomBarItem(
                  backgroundColor: Colors.deepPurple,
                  icon: Icon(Icons.face, color: Colors.black),
                  activeIcon: Icon(
                    Icons.face,
                    color: Colors.deepPurple,
                  ),
                  title: Text("Characters")),
              BubbleBottomBarItem(
                  backgroundColor: Colors.indigo,
                  icon: Icon(Icons.public, color: Colors.black),
                  activeIcon: Icon(
                    Icons.public,
                    color: Colors.indigo,
                  ),
                  title: Text("Locations")),
            ],
          );
        },
      ),
    );
  }
}

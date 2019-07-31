import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

enum NavBarItem {
  EPISODES,
  CHARACTERS,
  LOCATION,
}

class HomeBloc extends BlocBase {
  final _navBarController = PublishSubject<NavBarItem>();

  NavBarItem defaultItem = NavBarItem.CHARACTERS;
  int actualItem = NavBarItem.CHARACTERS.index;

  Observable<NavBarItem> get itemStream => _navBarController.stream;

  Function(NavBarItem) get changeItem => _navBarController.sink.add;
  void pickItem(int i) {
    if (i != actualItem) {
      switch (i) {
        case 0:
          changeItem(NavBarItem.EPISODES);
          actualItem = NavBarItem.EPISODES.index;
          break;
        case 2:
          changeItem(NavBarItem.LOCATION);
          actualItem = NavBarItem.LOCATION.index;
          break;
        case 1:
        default:
          actualItem = NavBarItem.CHARACTERS.index;
          changeItem(NavBarItem.CHARACTERS);
          break;
      }
    }
  }

  @override
  void dispose() {
    _navBarController.close();
    super.dispose();
  }
}

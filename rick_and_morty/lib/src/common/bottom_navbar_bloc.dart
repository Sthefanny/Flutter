import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rick_and_morty/src/models/navBarItemEnum.dart';
import 'package:rxdart/rxdart.dart';

class NavbarItemBloc extends BlocBase {
  final _navBarController = BehaviorSubject<NavBarItem>();
  final defaultItem = NavBarItem.EPISODES;

  Stream<NavBarItem> get navBarItem => _navBarController.stream;

  Function(NavBarItem) get changeNavBarItem => _navBarController.sink.add;

  void pickItem(int i) {
    switch (i) {
      case 0:
        changeNavBarItem(NavBarItem.EPISODES);
        break;
      case 1:
        changeNavBarItem(NavBarItem.CHARACTERS);
        break;
      case 2:
        changeNavBarItem(NavBarItem.LOCATIONS);
        break;
      default:
        changeNavBarItem(defaultItem);
        break;
    }
  }

  @override
  void dispose() {
    _navBarController.close();
    super.dispose();
  }
}

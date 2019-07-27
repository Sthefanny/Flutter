import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends BlocBase {
  final _pageController = BehaviorSubject<Widget>();
  final _pageIndexController = BehaviorSubject<int>.seeded(0);

  Stream<Widget> get page => _pageController.stream;
  Stream<int> get pageIndex => _pageIndexController.stream;

  Function(Widget) get changePage => _pageController.sink.add;
  Function(int) get changePageIndex => _pageIndexController.sink.add;

  @override
  void dispose() {
    _pageController.close();
    _pageIndexController.close();
    super.dispose();
  }
}

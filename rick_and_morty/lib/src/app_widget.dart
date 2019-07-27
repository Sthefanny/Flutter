import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/routes.dart';

import 'pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.initial,
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}

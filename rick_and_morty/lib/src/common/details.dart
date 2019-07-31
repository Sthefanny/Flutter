import 'package:flutter/material.dart';

import '../app_module.dart';
import 'bottom_navbar_bloc.dart';

class Details extends StatelessWidget {
  final navbarItembloc = AppModule.to.getBloc<NavbarItemBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: navbarItembloc.navBarItem,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Image(
                  image: NetworkImage(snapshot.data.image),
                ),
                Text(snapshot.data.name),
              ],
            );
          },
        );
      },
    );
  }
}

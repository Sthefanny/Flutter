import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/common/progress_widget.dart';
import 'package:rick_and_morty/src/models/responses/characterResponse.dart';

import 'characters_bloc.dart';
import 'characters_module.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final bloc = CharactersModule.to.getBloc<CharactersBloc>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: bloc.addCharacters(),
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: bloc.characters,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return ProgressWidget();

            return ListView.builder(
              itemCount: snapshot.data.results.length,
              itemBuilder: (context, int index) {
                return characterListTile(snapshot.data.results[index]);
              },
            );
          },
        );
      },
    );
  }

  Widget characterListTile(CharacterResult item) {
    return Card(
      child: ListTile(
        leading: Image(
          image: NetworkImage(item.image),
        ),
        title: Text(item.name),
        subtitle: Text(item.species),
        trailing: Text(item.gender),
      ),
    );
  }
}

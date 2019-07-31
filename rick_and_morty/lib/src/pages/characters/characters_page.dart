import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/common/progress_widget.dart';
import 'package:rick_and_morty/src/common/text_widget.dart';
import 'package:rick_and_morty/src/models/responses/characterResponse.dart';
import 'package:rick_and_morty/utils/routes.dart';

import 'characters_bloc.dart';
import 'characters_module.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _bloc = CharactersModule.to.getBloc<CharactersBloc>();

  @override
  void initState() {
    _bloc.addCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.characters,
      builder: (context, AsyncSnapshot<CharacterResponse> snapshot) {
        if (!snapshot.hasData) return ProgressWidget();

        return showList(snapshot.data.results);
      },
    );
  }

  Widget showList(List<CharacterResult> item) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, int index) {
        return characterListTile(item[index]);
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
        trailing: Text(item.status),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => buildDetails(item))),
      ),
    );
  }

  Widget buildDetails(CharacterResult item) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ListView(
        children: <Widget>[
          Image(
            image: NetworkImage(item.image),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              children: <Widget>[
                TextWidget(title: 'Status: ', text: item.status),
                TextWidget(title: 'Species: ', text: item.species),
                TextWidget(title: 'Gender: ', text: item.gender),
                TextWidget(title: 'Origin: ', text: item.origin.name),
                TextWidget(title: 'Location: ', text: item.location.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

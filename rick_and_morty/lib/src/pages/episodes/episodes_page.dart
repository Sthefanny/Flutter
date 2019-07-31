import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/common/progress_widget.dart';
import 'package:rick_and_morty/src/common/text_widget.dart';
import 'package:rick_and_morty/src/models/responses/episodeResponse.dart';
import 'package:rick_and_morty/src/pages/episodes/episodes_module.dart';

import 'episodes_bloc.dart';

class EpisodesPage extends StatefulWidget {
  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  final _bloc = EpisodesModule.to.getBloc<EpisodesBloc>();

  @override
  void initState() {
    _bloc.addEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.episodes,
      builder: (context, AsyncSnapshot<EpisodeResponse> snapshot) {
        if (!snapshot.hasData) return ProgressWidget();

        return showList(snapshot.data.results);
      },
    );
  }

  Widget showList(List<EpisodeResult> item) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, int index) {
        return characterListTile(item[index]);
      },
    );
  }

  Widget characterListTile(EpisodeResult item) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.airDate),
        trailing: Text(item.episode),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => buildDetails(item))),
      ),
    );
  }

  Widget buildDetails(EpisodeResult item) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
            child: Column(
              children: <Widget>[
                TextWidget(title: 'Status: ', text: item.airDate),
                TextWidget(title: 'Species: ', text: item.episode),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

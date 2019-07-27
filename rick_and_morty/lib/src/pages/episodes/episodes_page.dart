import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/common/progress_widget.dart';
import 'package:rick_and_morty/src/models/responses/episodeResponse.dart';
import 'package:rick_and_morty/src/pages/episodes/episodes_module.dart';

import 'episodes_bloc.dart';

class EpisodesPage extends StatefulWidget {
  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  final bloc = EpisodesModule.to.getBloc<EpisodesBloc>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: bloc.addEpisodes(),
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: bloc.episodes,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return ProgressWidget();

            return ListView.builder(
              itemCount: snapshot.data.results.length,
              itemBuilder: (context, int index) {
                return episodeListTile(snapshot.data.results[index]);
              },
            );
          },
        );
      },
    );
  }

  Widget episodeListTile(EpisodeResult item) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.airDate),
        trailing: Text(item.episode),
      ),
    );
  }
}

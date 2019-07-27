import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rick_and_morty/src/models/responses/episodeResponse.dart';
import 'package:rick_and_morty/src/repositories/episode_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'episodes_module.dart';

class EpisodesBloc extends BlocBase {
  final EpisodeRepository _repository = EpisodesModule.to.getDependency<EpisodeRepository>();

  final _episodeController = BehaviorSubject<EpisodeResponse>();

  Stream<EpisodeResponse> get episodes => _episodeController.stream;

  Function(EpisodeResponse) get changeEpisodes => _episodeController.sink.add;

  addEpisodes() async {
    try {
      var response = await _repository.getEpisodes();
      changeEpisodes(response);
    } catch (e) {
      throw new Exception(e.message);
    }
  }

  @override
  void dispose() {
    _episodeController.close();
    super.dispose();
  }
}

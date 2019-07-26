import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rick_and_morty/src/configs/appConfig.dart';
import 'package:rick_and_morty/src/models/responses/episodeResponse.dart';
import 'package:rick_and_morty/src/pages/episodes/episodes_module.dart';

class EpisodeRepository extends Disposable {
  final EpisodeRepository _repository = EpisodesModule.to.getDependency<EpisodeRepository>();

  final _url = '${AppConfig.baseUrl}/episode';

  Future<EpisodeResponse> getEpisodes() async {
    try {
      
    }
  }

  @override
  void dispose() {}
}

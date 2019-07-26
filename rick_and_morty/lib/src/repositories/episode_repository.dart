import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rick_and_morty/src/configs/appConfig.dart';
import 'package:rick_and_morty/src/pages/episodes/episodes_module.dart';

class EpisodeRepository extends Disposable {
  final AppConfig config = AppConfig();
  final EpisodeRepository _repository = EpisodesModule.to.getDependency<EpisodeRepository>();

  Future<>

  @override
  void dispose() {}
}

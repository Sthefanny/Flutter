import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rick_and_morty/src/models/responses/locationResponse.dart';
import 'package:rick_and_morty/src/repositories/location_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'locations_module.dart';

class LocationsBloc extends BlocBase {
  final LocationRepository _repository = LocationsModule.to.getDependency<LocationRepository>();

  final _locationController = BehaviorSubject<LocationResponse>();

  Stream<LocationResponse> get locations => _locationController.stream;

  Function(LocationResponse) get changeLocations => _locationController.sink.add;

  addLocations() async {
    try {
      var response = await _repository.getLocations();
      changeLocations(response);
    } catch (e) {
      throw new Exception(e.message);
    }
  }

  @override
  void dispose() {
    _locationController.close();
    super.dispose();
  }
}

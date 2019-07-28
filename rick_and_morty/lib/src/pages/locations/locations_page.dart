import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/common/progress_widget.dart';
import 'package:rick_and_morty/src/models/responses/locationResponse.dart';

import 'locations_bloc.dart';
import 'locations_module.dart';

class LocationsPage extends StatefulWidget {
  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final bloc = LocationsModule.to.getBloc<LocationsBloc>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: bloc.addLocations(),
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: bloc.locations,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return ProgressWidget();

            return ListView.builder(
              itemCount: snapshot.data.results.length,
              itemBuilder: (context, int index) {
                return locationListTile(snapshot.data.results[index]);
              },
            );
          },
        );
      },
    );
  }

  Widget locationListTile(LocationResult item) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.type),
        trailing: Text(item.dimension),
      ),
    );
  }
}

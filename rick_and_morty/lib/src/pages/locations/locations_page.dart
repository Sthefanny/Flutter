import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/common/progress_widget.dart';
import 'package:rick_and_morty/src/common/text_widget.dart';
import 'package:rick_and_morty/src/models/responses/locationResponse.dart';

import 'locations_bloc.dart';
import 'locations_module.dart';

class LocationsPage extends StatefulWidget {
  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final _bloc = LocationsModule.to.getBloc<LocationsBloc>();

  @override
  void initState() {
    _bloc.addLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.locations,
      builder: (context, AsyncSnapshot<LocationResponse> snapshot) {
        if (!snapshot.hasData) return ProgressWidget();

        return showList(snapshot.data.results);
      },
    );
  }

  Widget showList(List<LocationResult> item) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, int index) {
        return characterListTile(item[index]);
      },
    );
  }

  Widget characterListTile(LocationResult item) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.type),
        trailing: Text(item.dimension),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => buildDetails(item))),
      ),
    );
  }

  Widget buildDetails(LocationResult item) {
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
                TextWidget(title: 'Status: ', text: item.type),
                TextWidget(title: 'Species: ', text: item.dimension),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

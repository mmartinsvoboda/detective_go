import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

import 'package:detectivego/gameManager.dart' as gameManager;
import 'package:detectivego/Locations/gameLocation.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Marker currentLocationMarker = Marker(
      width: 45.0,
      height: 45.0,
      point: LatLng(0, 0),
      builder: (context) => Container(
            child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  print('Marker tapped!');
                }),
          ));
  List<Marker> markers = [];
// the user's initial location and current location
// as it moves
  LocationData currentLocation;
// wrapper around the location API
  Location location;
  MapController controller;

  @override
  void initState() {
    super.initState();

    for (GameLocation loc in gameManager.locations) {
      markers.add(Marker(
          width: 45.0,
          height: 45.0,
          point: LatLng(double.parse(loc.lat), double.parse(loc.long)),
          builder: (context) => Container(
                child: IconButton(
                    icon: Icon(Icons.my_location),
                    onPressed: () {
                      print(loc.name);
                    }),
              )));
    }

    markers.add(currentLocationMarker);

    //print("initState");

    // create an instance of Location
    location = new Location();
    controller = new MapController();
    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged.listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap(currentLocation);
    });
    //print("initStateFinished");
  }

  @override
  Widget build(BuildContext context) {
    //print("BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Application'),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
              mapController: controller,
              options: MapOptions(
                center: LatLng(49.194922, 16.608058),
                //zoom 18
                zoom: 18,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=QCNGim0evQWYk3LpOTkQ',
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(markers: markers),
              ])
        ],
      ),
    );
  }

  void updatePinOnMap(LocationData locationData) {
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    //print(locationData.toString());
    setState(() {
      // move marker to updated position
      var pinPosition = LatLng(locationData.latitude, locationData.longitude);
      markers.removeLast();
      markers.add(Marker(
          width: 45.0,
          height: 45.0,
          point: pinPosition,
          builder: (context) => Container(
                child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      print('Marker tapped!');
                    }),
              )));
    });
  }
}

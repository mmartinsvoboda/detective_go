import 'package:flutter/cupertino.dart';
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
      //point: LatLng(0, 0),
      builder: (context) => Container(
            child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  print('Marker tapped!');
                }),
          ));
  List<Marker> markers = [];
  LocationData currentLocation;
  Location location;
  MapController controller;

  bool inventoryIsOpened = false;
  bool locationIsOpened = false;
  GameLocation activeLocation;

  @override
  void initState() {
    super.initState();
    markers.add(currentLocationMarker);
    location = new Location();
    controller = new MapController();
    location.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      updateMap(currentLocation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        isMaterialAppTheme: true,
        data: Theme.of(context).copyWith(highlightColor: Colors.blueAccent),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            backgroundColor: Colors.white,
            onPressed: () {
              if (inventoryIsOpened) {
                inventoryIsOpened = false;
              } else {
                if (locationIsOpened) {
                  locationIsOpened = false;
                } else {
                  inventoryIsOpened = true;
                }
              }
              setState(() {});
            },
            child: Icon(
              (inventoryIsOpened || locationIsOpened)
                  ? Icons.clear
                  : Icons.search,
              color: Colors.black,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
                  ]),
              _customAppBar(),
              _buildInventoryTab(),
              _buildLocationTab(),
            ],
          ),
        ),
      ),
    );
  }

  void updateMap(LocationData locationData) {
    setState(() {
      var pinPosition = LatLng(locationData.latitude, locationData.longitude);

      markers.clear();
      for (GameLocation loc in gameManager.locations) {
        Distance distance = Distance();
        final double meters = distance.as(LengthUnit.Meter, pinPosition,
            LatLng(double.parse(loc.lat), double.parse(loc.long)));

        bool closeEnough = false;
        if (meters <= 20) {
          closeEnough = true;
        } else {
          closeEnough = false;
        }

        markers.add(Marker(
            width: loc.isKnown ? 45.0 : 0,
            height: loc.isKnown ? 45.0 : 0,
            point: LatLng(double.parse(loc.lat), double.parse(loc.long)),
            builder: (context) => Container(
                  child: IconButton(
                      icon: Icon(Icons.person_pin_circle,
                          color: closeEnough ? Colors.green : Colors.grey),
                      iconSize: loc.isKnown ? 30 : 0,
                      onPressed: () {
                        if (closeEnough &&
                            !inventoryIsOpened &&
                            !locationIsOpened) {
                          activeLocation = loc;
                          locationIsOpened = true;
                          setState(() {});
                        }
                      }),
                )));
      }

      markers.add(Marker(
          width: 0.0,
          height: 0.0,
          point: pinPosition,
          builder: (context) => GestureDetector(
                onTap: () {
                  print("tapped");
                },
                child: Container(
                  child: IconButton(
                      icon: Icon(Icons.person), iconSize: 25, onPressed: () {}),
                ),
              )));
    });
  }

  _buildInventoryTab() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      left: 0,
      right: 0,
      bottom: inventoryIsOpened ? 0 : -260,
      child: Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "INVENTÁŘ",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("OSOBY"),
                    SizedBox(height: 8),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.pause,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("VODÍTKA"),
                    SizedBox(height: 8),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.pause,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("PROHLÍŽEČ"),
                    SizedBox(height: 8),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.pause,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                )
              ],
            )),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, -5.0),
                blurRadius: 6.0,
              )
            ]),
      ),
    );
  }

  _buildLocationTab() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      left: 0,
      right: 0,
      bottom: locationIsOpened ? 0 : -260,
      child: Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              activeLocation == null ? "lokace" : activeLocation.name,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("OSOBY"),
                    SizedBox(height: 8),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.pause,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
              ],
            )),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, -5.0),
                blurRadius: 6.0,
              )
            ]),
      ),
    );
  }

  _customAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 60,
        child: Center(
          child: Text(
            'Záhada krvavého cheeseburgeru'.toUpperCase(),
            style: TextStyle(
                color: Colors.black, letterSpacing: 1.2, fontSize: 18),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
    );
  }
}

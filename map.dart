import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ishare/utills/button.dart';

import 'package:ishare/utills/colors.dart';

import 'package:location/location.dart';

class Maps extends StatefulWidget {
  final bool flag;
  Maps({this.flag = false});

  @override
  _MapsState createState() => _MapsState(flag: flag);
}

class _MapsState extends State<Maps> {
  final flag;
  _MapsState({this.flag});
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(33.6844, 73.0479);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  final Location location = Location();
  LatLng _currentLocation;

  bool _loading = false;

  Future<void> _getLocation() async {
    setState(() {
      _loading = true;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _currentLocation =
            LatLng(_locationResult.latitude, _locationResult.longitude);
        _loading = false;
      });
    } on PlatformException catch (error) {
      setState(() {
        _loading = false;
      });
    }
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is a Title',
            snippet: 'This is a snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      mini: true,
      heroTag: null,
      backgroundColor: AppColors().liteColorWithOpacity(1),
      child: Icon(
        icon,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition _myLocation = CameraPosition(
      bearing: 192,
      target: (_currentLocation == null)
          ? LatLng(33.6844, 73.0479)
          : _currentLocation,
      tilt: 59.440,
      zoom: 10.0,
    );

    Future<void> _goToMyLocation() async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_myLocation));
    }

    return Container(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 10.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Icon(
                CupertinoIcons.location_solid,
                size: 40,
                color: Colors.red,
              )),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  button(_onMapTypeButtonPressed, CupertinoIcons.map),
                  SizedBox(
                    height: 16.0,
                  ),
                  button(_goToMyLocation, CupertinoIcons.location_fill),
                  SizedBox(
                    height: 16.0,
                  ),
                  button(_onAddMarkerButtonPressed, Icons.add_location),
                ],
              ),
            ),
          ),
          flag
              ? Positioned(
                  bottom: 35,
                  right: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        onTap: () {},
                        name: "Set pickup location",
                        width: 0.7,
                      )
                    ],
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }
}

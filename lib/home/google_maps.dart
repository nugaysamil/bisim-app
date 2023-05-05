// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yenibisim/initalize/app_builder.dart';

import '../data_provider/data_provider.dart';
import '../widgets/build_sheet.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends ConsumerStatefulWidget {
  const MapSample({super.key});

  @override
  MapSampleState createState() => MapSampleState();
}

double distance = 0.0;

Set<Marker> _markers = {};
Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

class MapSampleState extends ConsumerState<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  BitmapDescriptor? markerIcon;

  String mapTheme = '';

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(38.432, 27.1368), //izmir kordon
    zoom: 14.4746,
  );

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
  }

  @override
  void initState() {
    getLocation();
    addCustomIcon();
    DefaultAssetBundle.of(context)
        .loadString('assets/maptheme/silver_theme.json')
        .then((value) {
      mapTheme = value;
    });
    super.initState();
  }

  void addCustomIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/location-2.png");
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(mapTheme);
              _controller.complete(controller);
            },
          ),
          Column(
            children: [
              _zoomplusFunction(),
              _zoominusfunction(),
            ],
          ),
          ref.watch(singleUserDataProvider).when(
            data: (data) {
              int j = 0;
              for (var station in data!.network!.stations!) {
                _markers.add(
                  Marker(
                    markerId: MarkerId(
                      j.toString(),
                    ),
                    position: LatLng(
                      station.latitude ?? 0,
                      station.longitude ?? 0,
                    ),
                    icon: markerIcon!,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(32),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return BuildSheet(station: station);
                        },
                      );
                    },
                  ),
                );

                j += 1;
              }

              return (Text('Error'));
            },
            error: (((error, stackTrace) {
              return Text(''.toString());
            })),
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  Widget _zoominusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        iconSize: 35,
        icon: Icon(
          Icons.zoom_out,
          color: Colors.black,
        ),
        onPressed: () {
          zoomVal--;
          _minus(zoomVal);
        },
      ),
    );
  }

  Widget _zoomplusFunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        iconSize: 35,
        icon: Icon(
          Icons.zoom_in,
          color: Colors.black,
        ),
        onPressed: () {
          zoomVal++;
          _minus(zoomVal);
        },
      ),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(38.432, 27.1368), zoom: zoomVal),
      ),
    );
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(38.432, 27.1368), zoom: zoomVal),
      ),
    );
  }
}



/*  var distance;
    Marker closestMarker = _markers.first;

    _closestDistance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        _markers.elementAt(0).position.latitude,
        _markers.elementAt(0).position.longitude);

    for (int i = 0; i < _markers.length; i++) {
      distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          _markers.elementAt(i).position.latitude,
          _markers.elementAt(i).position.longitude);

      print(distance);

      if (distance < _closestDistance) {
        closestMarker = _markers.elementAt(i);
        _closestDistance = distance;
      }
    }
    print("The closess  " + _closestDistance.toString()); */
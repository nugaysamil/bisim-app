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

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  LatLng startLocation = LatLng(27.6683619, 85.3101895);
  LatLng endLocation = LatLng(27.6875436, 85.2751138);

  PolylinePoints polylinePoints = PolylinePoints();

  List<LatLng> polylineCoordinates = [];

  /* getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyC0FxhPnz3hEz1-SDFhS2dIc5Ld6CaK7n4",
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    ); */

  /*   if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    double totalDistance = 0;

    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print(totalDistance);  */
/* 
    addPolyLine(List<LatLng> polylineCoordinates) {
      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.deepPurpleAccent,
        points: polylineCoordinates,
        width: 8,
      );
      polylines[id] = polyline;
      setState(() {});
    }

    setState(() {
      distance = totalDistance;
    });

    addPolyLine(polylineCoordinates);  */

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
              return Text(error.toString());
            })),
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
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
}

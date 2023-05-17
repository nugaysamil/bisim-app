// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yenibisim/initalize/app_builder.dart';
import 'package:yenibisim/widgets/bottom_navigation_bar.dart';

import '../data_provider/data_provider.dart';
import '../widgets/alert_dialog_widget.dart';
import '../widgets/build_sheet.dart';
import 'package:geolocator/geolocator.dart';

import 'announcement_widget.dart';
import 'menu_items.dart';

class MapSample extends ConsumerStatefulWidget {
  const MapSample({super.key});

  @override
  MapSampleState createState() => MapSampleState();
}

double distance = 0.0;

Set<Marker> _markers = {};

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

              return (Text(''));
            },
            error: (((error, stackTrace) {
              return Text(''.toString());
            })),
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NavigatorBar(),
            ],
          ), 
          Positioned(
            bottom: 110.0,
            right: 160.0,
            child: FloatingActionButton.large(
              elevation: 10,
              backgroundColor: Colors.green,
              onPressed: () {
                _dialogBuilder(context);
              },
              child: Text(
                'KİRALA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 110.0,
            right: 20.0,
            child: FloatingActionButton(
              elevation: 20,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Image.asset('assets/icons/cycle.png'),
            ),
          ),
          Positioned(
            bottom: 110.0,
            right: 360.0,
            child: FloatingActionButton(
              elevation: 10,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Image.asset('assets/icons/settings.png'),
            ),
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
  Future<void> _dialogBuilder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Kiralama Yöntemi Seçin',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: SizedBox(
          width: 150,
          height: 180,
          child: Column(
            children: [
              FilledButton(
                onPressed: () {},
                child: Text(
                  'Tek şifre girin',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 8),
              FilledButton(
                onPressed: () {},
                child: Text(
                  'Qr kod ile Kirala',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge
                ),
                child: const Text('Kapat'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
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
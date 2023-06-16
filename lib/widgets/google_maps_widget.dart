// ignore_for_file: unused_local_variable, unused_field, unused_element

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yenibisim/core/credit_card_loading.dart';
import 'package:yenibisim/home/core/fault_notification_widget.dart';
import 'package:yenibisim/product/constant/string_constant.dart';
import 'package:yenibisim/widgets/bicycle_list_details.dart';
import 'package:yenibisim/widgets/button_widget.dart';

import '../data_provider/data_provider.dart';
import '../initalize/app_bar.dart';
import 'build_sheet.dart';

class GoogleMaps extends ConsumerStatefulWidget {
  const GoogleMaps({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GoogleMapsState();
}

Set<Marker> _markers = {};

class _GoogleMapsState extends ConsumerState<GoogleMaps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  BitmapDescriptor? markerIcon;

  String mapTheme = '';

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(38.432, 27.1368), 
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
              Container(
                color: Colors.grey.shade300,
                child: ButtonWidget(
                    changeString: StringConstants.creditName,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreditCard(),
                        ),
                      );
                    }),
              ),
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
          Positioned(
            bottom: 10.0,
            right: 170.0,
            child: FloatingActionButton.large(
              heroTag: null,
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
            bottom: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: null,
              elevation: 20,
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BicycleListDetails(),
                    ));
              },
              child: Image.asset('assets/icons/cycle.png'),
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 360.0,
            child: FloatingActionButton(
              heroTag: null,
              elevation: 10,
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FaultNotification(),
                    ));
              },
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: ((BuildContext context) {
                        return AlertDialog(
                          title: Align(
                              alignment: Alignment.center,
                              child: Text('Yetersiz bakiye')),
                          content: SizedBox(
                            width: 150,
                            height: 180,
                          ),
                        );
                      }),
                    );
                  },
                  child: Text(
                    'Tek şifre girin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(height: 8),
                FilledButton(
                  onPressed: () {
                    _pickCamera(ImageSource.camera);
                  },
                  child: Text(
                    'Qr kod ile Kirala',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge),
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

  File? _image;
  Future _pickCamera(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}

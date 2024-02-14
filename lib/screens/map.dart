import 'package:Bliss/widgets/googleMapSingleMap.dart';
import 'package:Bliss/widgets/helperClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';


/// This widget helps us to draw multiple polylines on the google map
class WidgetGoogleMap extends StatefulWidget {
  @override
  _WidgetGoogleMapState createState() => _WidgetGoogleMapState();
}

class _WidgetGoogleMapState extends State<WidgetGoogleMap> {
  Set<Marker> markers = {};

  LatLng? source;

  Map<PolylineId, Polyline> polyLines = <PolylineId, Polyline>{};

  int polyLineIdCounter = 0;

  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    _determinePosition().then((value) {
      setState(() {
        source = LatLng(value.latitude, value.longitude);
      });
      sendRequest();
    });
  }

  List<LatLng> listLocations = [
    const LatLng(18.524394718600227, -69.92902729974034),
    const LatLng(18.518128061745273, -69.91520855858201),
    const LatLng(18.5267548290468, -69.9163243574848),
    const LatLng(18.48343157725851, -69.92797762255782),
    const LatLng(18.45828833474722, -69.91386566041042),
    const LatLng(18.471799994677216, -69.89569991262424),
  ];

  @override
  Widget build(BuildContext context) {
     // ignore: unused_local_variable
    String _scanResult = "";

    Future<void> scanCode() async {
      String barcodeScanRes;
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#1D252B',
          'cancel',
          true,
          ScanMode.QR,
        );
      } on PlatformException {
        barcodeScanRes = 'Failed to start';
      }

      setState(() {
        _scanResult = barcodeScanRes;
      });
    }
    return Scaffold(
        body: Padding(padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(
          children: [
            source == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                polylines: Set<Polyline>.of(polyLines.values),
                markers: markers,
                onMapCreated: (c) {
                  mapController = c;
                },
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: source!,
                  zoom: 14.0,
                ),
                mapType: MapType.normal,
              ), 
               Container(
            margin: const EdgeInsets.only(bottom: 100, right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 55,
                minWidth: 45,
                color: const Color(0xFF2E9A76),
                textColor: Colors.white,
                child: const Icon(Iconsax.scan_barcode),
                onPressed: () {
                  scanCode();
                },
              ),
            ),
          ),    
          ],
        ),
        ),
    );
  }

  void sendRequest() {
    getMultiplePolyLines();
    addMarker();
  }


  // here we simply assign the bytes which we get from the icon common method to the marker
  Future<void> addMarker() async {
    markers.add(Marker(
        markerId: MarkerId(source.toString()),
        position: source!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));
    listLocations.forEach((element) {
      markers.add(Marker(
          markerId: MarkerId(element.toString()),
          position: element,
          onTap: () {
            HelperClass()
                .onMarkerTapped(source!, element, context, mapController);
          }));
    });
  }

  getMultiplePolyLines() async {
    await Future.forEach(listLocations, (LatLng elem) async {
      await _getRoutePolyline(
        start: source!,
        finish: elem,
        color: Colors.green,
        id: 'firstPolyline $elem',
        width: 10,
      );
    });

    setState(() {});
  }

  Future<Polyline> _getRoutePolyline(
      {required LatLng start,
      required LatLng finish,
      required Color color,
      required String id,
      int width = 10}) async {
    // Generates every polyline between start and finish
    final polylinePoints = PolylinePoints();
    // Holds each polyline coordinate as Lat and Lng pairs
    final List<LatLng> polylineCoordinates = [];

    final startPoint = PointLatLng(start.latitude, start.longitude);
    final finishPoint = PointLatLng(finish.latitude, finish.longitude);

    final result = await polylinePoints.getRouteBetweenCoordinates(
      APIKEY,
      startPoint,
      finishPoint,
    );

    if (result.points.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      });
    }

    polyLineIdCounter++;

    final Polyline polyline = Polyline(
        polylineId: PolylineId(id),
        consumeTapEvents: true,
        points: polylineCoordinates,
        color: Colors.red,
        width: 10,
        onTap: () {
        });

    setState(() {
      polyLines[PolylineId(id)] = polyline;
    });

    return polyline;
  }
}

String APIKEY = "AIzaSyDJP01bzEaZQqPY4V7wSils1GCTqgAFdrg";

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    permission = await Geolocator.requestPermission();

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
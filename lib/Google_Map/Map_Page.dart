import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';


void main()
{
  runApp(
      const MaterialApp(
        title: 'Map Activity',
        debugShowCheckedModeBanner: false,
        home: const Mymap_app(),
      )
  );
}

class Mymap_app extends StatefulWidget
{
  const Mymap_app({super.key});
  @override
  State<Mymap_app> createState() => MapSampleState();
}

class MapSampleState extends State<Mymap_app> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
       //  onPressed: ()
       //  {
       //    Navigator.push(context, MaterialPageRoute(builder: (context)=>const  GeolocatorWidget()));
       //
       //  },
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}


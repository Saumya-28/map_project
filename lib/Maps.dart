import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget{
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;
  LatLng _center = const LatLng(22.5726, 88.3639);
  Set<Marker> _markers = {};
  Set<Polygon> _polygons = {};
  Set<Circle> _circles = {};

  CameraPosition _kGoogle =  CameraPosition(
    target: LatLng(22.5726, 88.3639),
    zoom: 14,
    bearing: 61.403038024902344,
    tilt: 41.82725143432617,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker() {
    setState(() {
      _clearShapes();
      _markers.add(
        Marker(
          markerId: MarkerId('marker'),
          position: _center,
          icon: BitmapDescriptor.defaultMarker,
          draggable: true,
          onDragEnd: (LatLng position) {
            setState(() {
              _center = position;
            });
          },
        ),
      );
    });
  }


  void _addPolygon() {
    setState(() {
      _clearShapes();
      _polygons.add(
        Polygon(
          polygonId: PolygonId('polygon'),
          points: _createPoints(),
          strokeWidth: 2,
          strokeColor: Colors.red,
          fillColor: Colors.blue.withOpacity(0.5),
        ),
      );
    });
  }

  //For Square
  List<LatLng> _createPoints() {
    List<LatLng> points = [];
    points.add(LatLng(22.5726, 88.3639));   //point1
    points.add(LatLng(22.5726, 88.3739));   //point2
    points.add(LatLng(22.5826, 88.3739));   //point3
    points.add(LatLng(22.5826, 88.3639));   //point4
    return points;
  }

  void _addCircle() {
    setState(() {
      _clearShapes();
      _circles.add(
        Circle(
          circleId: CircleId('circle'),
          center: _center,
          radius: 2000,
          fillColor: Colors.blue.withOpacity(0.3),
          strokeWidth: 3,
          strokeColor: Colors.blue,
        ),
      );
    });
  }

  void _clearShapes() {
    setState(() {
      _markers.clear();
      _polygons.clear();
      _circles.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.normal,
        compassEnabled: true,
        circles: _circles,
        polygons: _polygons,
        markers: _markers,
        initialCameraPosition: _kGoogle,
        onTap: (LatLng latLng) {
          print('Tapped: $latLng');
          setState(() {
            _center=latLng;
          });
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 64.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _addMarker,
              child: Icon(Icons.place,color: Colors.black87,),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 16),
            FloatingActionButton(
              onPressed: _addPolygon,
              child: Icon(Icons.star,color: Colors.black87),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 16),
            FloatingActionButton(
              onPressed: _addCircle,
              child: Icon(Icons.circle,color: Colors.black87),
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

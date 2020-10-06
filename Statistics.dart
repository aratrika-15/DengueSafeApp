import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(MaterialApp(
    home: (Statistics()),
  ));
}

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(1.290270, 103.851959);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: Text('Dengue Clusters outside of NTU'),
          backgroundColor: Colors.deepPurple[700],
        ),
        body: Column(
          children: [
            SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 3 / 4,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 15.0,
                  ),
                )
            ),
            SizedBox(height: 5.0),
          ],
        )
    );
  }
}


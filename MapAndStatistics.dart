import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Statistics.dart';
import 'GovtDatabase.dart';

void main() {
  runApp(MaterialApp(
    home: MapAndStatistics(),
  ));
}

class MapAndStatistics extends StatefulWidget {
  @override
  _MapAndStatisticsState createState() => _MapAndStatisticsState();
}

class _MapAndStatisticsState extends State<MapAndStatistics> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(1.3483, 103.6831);

  Future navigateToSubPage(context, func) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => func));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: Text(
            'Map And Statistics',
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[700],
        ),
        body: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 3 / 4,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition:
                  CameraPosition(target: _center, zoom: 15),
                )),
            SizedBox(height: 5.0),
            RaisedButton.icon(
              onPressed: () {
                navigateToSubPage(context, GovtDatabase());
              },
              icon: Icon(
                Icons.bubble_chart,
                color: Colors.white,
              ),
              label: Text('See Statistics',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.deepPurpleAccent[700],
            ),

          ],
        ));
  }
}
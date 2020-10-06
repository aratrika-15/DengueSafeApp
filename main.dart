import 'package:flutter/material.dart';
import 'package:flutter_app/FAQ.dart';
import 'package:flutter_app/MapAndStatistics.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int totalCases = 0;
  int newCases = 0;
  Future navigateToSubPage(context, func) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => func));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 90.0, 20.0, 0.0),
        child: Column(
          children: [
            Image.network(
                'https://web.hss.ntu.edu.sg/gaOresearchteam/images/ntu_logo.jpg'),
            SizedBox(height: 20.0),
            Center(
              child: Text('~  DengueSafe  ~',
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.black,
                    letterSpacing: 3.0,
                  )),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text('Stay Safe, Stay Healthy.',
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Colors.black,
                    letterSpacing: 1.0,
                  )),
            ),
            SizedBox(height: 50.0),
            Container(
              color: Colors.deepPurple[100],
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('''TOTAL 
CASES''',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    child: Text(
                      '$totalCases',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                      height: 60,
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 5.0,
                      )),
                  SizedBox(width: 20.0),
                  Container(
                      child: Text('''CASES
TODAY''',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.black,
                          ))),
                  SizedBox(width: 24.0),
                  Container(
                    child: Text(
                      '$newCases',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              color: Colors.deepPurple[100],
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  RaisedButton.icon(
                    onPressed: () {
                      navigateToSubPage(context, MapAndStatistics());
                    },
                    icon: Icon(Icons.location_on, color: Colors.white),
                    label: Text('''Hotspot Map 
    and Stats''', style: TextStyle(color: Colors.white)),
                    color: Colors.deepPurpleAccent[700],
                  ),
                  RaisedButton.icon(
                    onPressed: () {
                      navigateToSubPage(context, FAQPage());
                    },
                    icon: Icon(Icons.question_answer, color: Colors.white),
                    label: Text('''Frequently Asked
      Questions''', style: TextStyle(color: Colors.white)),
                    color: Colors.deepPurpleAccent[700],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

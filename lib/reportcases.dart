import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dialog.dart';

void main() {
  runApp(Report());
}

class Report extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReportPage(),
    );
  }
}

class ReportPage extends StatefulWidget {
  ReportPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String id;
  String hall;
  String number;
  String DB_Cases;
  String DB_Hall;
  int num_Cases;
  final List<String> hallnames = ['1', '2', '3', '4', '5', '6', '7', '8', '9','10','11','12','13','14','15','16','Crescent', 'Pioneer','Binjai','Tanjong','Banyan','Saraca','Tamarind', 'Meranti', 'Graduate Hall 1','Graduate Hall 2'];

  //int number = 1;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  void createRecord() async {

    if (hall == '1') {
      number = '1';
    }
    if (hall == '2') {
      number = '2';
    }
    if (hall == '3') {
      number = '3';
    }
    if (hall == '4') {
      number = '4';
    }

    if (hall == '5') {
      number = '5';
    }

    if (hall == '6') {
      number = '6';
    }

    if (hall == '7') {
      number = '7';
    }

    if (hall == '8') {
      number = '8';
    }

    if (hall == '9') {
      number = '9';
    }
    if (hall == '10') {
      number = '10';
    }
    if (hall == '11') {
      number = '11';
    }

    if (hall == '12') {
      number = '12';
    }
    if (hall == '13') {
      number = '13';
    }

    if (hall == '14') {
      number = '14';
    }
    if (hall == '15') {
      number = '15';
    }
    if (hall == '16') {
      number = '16';
    }
    if (hall == 'Meranti') {
      number = '17';
    }
    if (hall == 'Tamarind') {
      number = '18';
    }
    if (hall == 'Saracca') {
      number = '19';
    }
    if (hall == 'Binjai') {
      number = '20';
    }
    if (hall == 'Tanjong') {
      number = '21';
    }

    if (hall == 'Banyan') {
      number = '22';
    }
    if (hall == 'Crescent') {
      number = '23';
    }

    if (hall == 'Pioneer') {
      number = '23';
    }

    if (hall == 'Graduate Hall 1') {
      number = '23';
    }
    if (hall == 'Graduate Hall 2') {
      number = '23';
    }

    final databaseReference = FirebaseDatabase.instance.reference();
    final databaseChild = databaseReference.child(number);
    databaseChild.once().then((DataSnapshot snapshot) {
      DB_Hall = snapshot.value["A"].toString();
      DB_Cases = snapshot.value["B"].toString();
      num_Cases = int.parse(DB_Cases) + 1;
      databaseChild.update({
        'A': hall,
        'B': num_Cases.toString(),
      });
    });

  }

  String validateEmployeeID(value) {
    var numValue = int.tryParse(value);
    if (value.isEmpty) {
      return "Employee ID is required";
    } else if (numValue > 15) {
      return "Invalid Employee ID";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Report Dengue Cases"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.always,
            //auto validating when keying
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Employee ID",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          top: 15, left: 5, right: 0, bottom: 15),
                      // add padding to adjust icon
                      child: Icon(Icons.help_outline),
                    ),
                  ),
                  onSaved: (value) => id = value,
                  validator: validateEmployeeID,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Hall Number",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 5, right: 0, bottom: 15),
                          // add padding to adjust icon
                          child: Icon(Icons.house),
                        ),
                      ),
                      items: hallnames.map((hallname) {
                        return DropdownMenuItem(
                          value: hallname,
                          child: Text('$hallname'),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => hall = value),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Hall No. required";
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: RaisedButton(
                    onPressed: () async {
                      if (formkey.currentState.validate()) {
                        formkey.currentState.save();
                        createRecord();

                        // final action = await Dialogs.yesAbortDialog(context, 'Record have been successfully added', 'Continue adding record or Logout?');
                        // if (action == DialogAction.add) {
                        //   print("Add Record Again");
                        //  } else {
                        //   print("Logout");
                        //  }

                      }
                    },
                    child: Text("Add Record"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

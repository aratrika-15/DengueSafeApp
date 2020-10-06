import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class GovtDatabase extends StatefulWidget {
  @override
  _GovtDatabase createState() => _GovtDatabase();
}

class _GovtDatabase extends State<GovtDatabase> {
    List<List<dynamic>> data_all=[];

  loadAsset() async {
    data_all = [];
    List<List<dynamic>> data = [];
    List<String> myList = List<String>();

    final myData_sw = await rootBundle.loadString('Assets/dengue-cases-south-west.csv');
    final myData_nw = await rootBundle.loadString('Assets/dengue-cases-north-west.csv');
    final myData_se = await rootBundle.loadString('Assets/dengue-cases-south-east.csv');
    final myData_ne = await rootBundle.loadString('Assets/dengue-cases-north-east.csv');
    final myData_ctrl = await rootBundle.loadString('Assets/dengue-cases-central.csv');

    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData_sw);
    data = csvTable;
    int i =0;
    data.forEach((element) {
      i++;
    });
    myList.add("South-West");
    myList.add(i.toString());
    data_all.add(myList);

    csvTable = CsvToListConverter().convert(myData_nw);
    data = csvTable;
    i=0;
    myList = [];
    data.forEach((element) {
      i++;
    });
    myList.add("North-West");
    myList.add(i.toString());
    data_all.add(myList);

    csvTable = CsvToListConverter().convert(myData_se);
    data = csvTable;
    i=0;
    myList = [];
    data.forEach((element) {
      i++;
    });
    myList.add("South-East");
    myList.add(i.toString());
    data_all.add(myList);

    csvTable = CsvToListConverter().convert(myData_ne);
    data = csvTable;
    i=0;
    myList = [];
    data.forEach((element) {
      i++;
    });
    myList.add("North-East");
    myList.add(i.toString());
    data_all.add(myList);

    csvTable = CsvToListConverter().convert(myData_ctrl);
    data = csvTable;
    i=0;
    myList = [];
    data.forEach((element) {
      i++;
    });
    myList.add("Central");
    myList.add(i.toString());
    data_all.add(myList);

    print(data_all);

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () async {
            await loadAsset();
            print(data_all);
          }),
      appBar: AppBar(
        title: Text("Table Layout and CSV"),
      ),
      body: SingleChildScrollView(
        child: Table(
          /*columnWidths: {
            0: FixedColumnWidth(200.0),
            1: FixedColumnWidth(200.0),
          },*/
          border: TableBorder.all(width: 1.0),
          children: data_all.map((item) {
            return TableRow(
                children: item.map((row) {
                  return Container(
                    color:
                    row.toString().contains("NA") ? Colors.red : Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        row.toString(),
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  );
                }).toList());
          }).toList(),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'QuestionAnswerList.dart';

void main() {
  runApp(MaterialApp(
    home: FAQPage(),
  ));
}

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List qA = QuestionAnswerList.getList();
  Widget faqTemplate(qA) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 4.0, 6.0, 4.0),
          child: Text(qA.question,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              )),
        ),
        SizedBox(height: 2.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 4.0, 6.0, 4.0),
          child: Text(qA.answer,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                letterSpacing: 1.0,
              )),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text(
          'Frequently Asked Questions',
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Column(
        children: qA.map((qA) => faqTemplate(qA)).toList(),
      ),
    );
  }
}

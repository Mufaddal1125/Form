import 'package:flutter/material.dart';
import 'package:form/dialog.dart';
import 'widgets.dart';
import 'dart:developer' as developer;
import 'checkbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'Text';
  List<Widget> dynamicListWidget = [];
  var title;

  getName(List data) {
    developer.log('got name from child ' + data.toString());
    developer.log('recieved options from dialog' + data[2].toString());
    setState(() {
      switch (data[1].toString()) {
        case 'Text':
          dynamicListWidget.add(Container(
              child: TextField(
            decoration: textFieldInputDecoration(data[0], context),
          )));
          break;

        case 'Number':
          dynamicListWidget.add(Container(
              child: TextField(
            decoration: textFieldInputDecoration(data[0], context),
            keyboardType: TextInputType.number,
          )));
          break;
        case 'DropDown':
          dynamicListWidget.add(Column(
            children: [
              TextField(
                decoration: textFieldInputDecoration(data[0], context),
              ),
              ...data[2].map<Text>((value) {
                return Text(value);
              }).toList()
            ],
          ));
          break;
      }
    });
  }

  Widget addInput(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: textFieldInputDecoration('Name', context),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dynamicListWidget,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ShowDialog(getName),
    );
  }
}

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'checkbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
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
  String dropDownValue = 'Green';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: [
              Container(
                child: TextField(
                  decoration: textFieldInputDecoration("Enter Text", context),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: textFieldInputDecoration("Enter Number", context),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: CheckBoxList(),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      'Select Anything:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: dropDownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Theme.of(context).accentColor,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropDownValue = newValue;
                      });
                    },
                    items: <String>['Green', 'Red', 'Blue', 'Black']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.deepOrange,
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

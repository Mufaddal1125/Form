import 'package:flutter/material.dart';
import 'widgets.dart';

class CheckBoxList extends StatefulWidget {
  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  bool _checkedPython = false;
  bool _checkedJS = false;
  bool _checkedDart = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Text(
          'Which are Your Favourite Language?',
          style: headTextStyle(),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      CheckboxListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        title: Text('Python'),
        value: _checkedPython,
        onChanged: (bool value) {
          setState(() {
            _checkedPython = value;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.green[200],
        checkColor: Colors.green[600],
      ),
      CheckboxListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        title: Text('JavaScript'),
        value: _checkedJS,
        onChanged: (bool value) {
          setState(() {
            _checkedJS = value;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.green[200],
        checkColor: Colors.green[600],
      ),
      CheckboxListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        title: Text('Dart'),
        value: _checkedDart,
        onChanged: (bool value) {
          setState(() {
            _checkedDart = value;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.green[200],
        checkColor: Colors.green[600],
      ),
    ]);
  }
}

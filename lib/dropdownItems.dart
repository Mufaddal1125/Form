import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class DropdownItems extends StatefulWidget {
  List options;

  DropdownItems(this.options);

  @override
  _DropdownItemsState createState() => _DropdownItemsState();
}

class _DropdownItemsState extends State<DropdownItems> {
  List<Widget> dropDownOptionsList = [];

  Key optionsKey;
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            key: optionsKey,
            children: dropDownOptionsList,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  dropDownOptionsList.add(
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Option'),
                      onFieldSubmitted: (value) {
                        widget.options.add(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        widget.options.add(value);
                      },
                    ),
                  );
                });
              },
              child: Text('Add Option')),
          ElevatedButton(
              onPressed: () {
                return false;
              },
              child: Text('Add'))
        ],
      ),
    );
  }
}

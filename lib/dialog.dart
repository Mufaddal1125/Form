import 'package:flutter/material.dart';
import 'widgets.dart';
import 'dropdownItems.dart';
import 'dart:developer' as developer;

class ShowDialog extends StatefulWidget {
  String text;
  Function(List) getName;
  ShowDialog(this.getName);

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {
    var dropdownValue = 'Text';
    List<String> _items = ['Text', 'Number', 'CheckBox', 'DropDown'].toList();
    var _nameController = TextEditingController();
    List options = [];
    GlobalKey<FormState> formKey = GlobalKey();

    _showMaterialDialog(BuildContext context) {
      return showDialog<List>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: <
                        Widget>[
                      TextField(
                        controller: _nameController,
                        decoration: textFieldInputDecoration('Name', context),
                      ),
                      Row(
                        children: [
                          Text('Select Type'),
                          SizedBox(
                            width: 30,
                          ),
                          DropdownButton<String>(
                            items: _items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            iconSize: 24,
                            elevation: 16,
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      if (dropdownValue == 'DropDown')
                        Form(
                          key: formKey,
                          child: DropdownItems(options),
                        )
                    ]),
                  );
                },
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Add"),
                  onPressed: () {
                    print('Action ${options.toString()}');

                    developer.log(formKey.currentContext.toString());
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      developer.log(options.toString());
                    }
                    Navigator.pop(context,
                        [_nameController.text, dropdownValue, options]);
                  },
                )
              ],
            );
          });
    }

    return Container(
      child: FloatingActionButton(
        onPressed: () {
          _showMaterialDialog(context).then((value) => {
                developer.log("Returning value to parent " + value.toString()),
                widget.getName(value),
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

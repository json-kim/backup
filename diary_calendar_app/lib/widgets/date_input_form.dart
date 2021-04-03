import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/date.dart';
import '../provider/dates_provider.dart';

class DateInputForm extends StatefulWidget {
  final DateTime date;
  final Function submitInput;

  DateInputForm(this.date, this.submitInput);

  @override
  _DateInputFormState createState() => _DateInputFormState();
}

class _DateInputFormState extends State<DateInputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var inputDate;

  void _saveDate(Date inputDate) {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitInput(context, inputDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: '일기'),
            validator: (value) {
              if (value.trim().isEmpty) {
                return '일기를 작성해주세요!';
              }
              return null;
            },
            onSaved: (value) {
              inputDate =
                  Date(color: null, text: value.trim(), date: widget.date);
            },
          ),
        ],
      ),
    );
  }
}

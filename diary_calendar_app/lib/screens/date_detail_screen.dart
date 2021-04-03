import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/date.dart';
import '../widgets/date_input_form.dart';
import '../provider/dates_provider.dart';
import '../helps/date_helper.dart';

class DateDetailScreen extends StatelessWidget {
  static const routeName = '/date-detail';

  void _submitInputForm(BuildContext ctx, Date date) {
    Provider.of<DatesProvider>(ctx, listen: false).inputDate(date);
  }

  @override
  Widget build(BuildContext context) {
    final date = ModalRoute.of(context).settings.arguments as DateTime;

    return Scaffold(
      appBar: AppBar(
        title: Text('Date Detail Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '${date.year.toString()}/${date.month.toString()}/${date.day.toString()}/${DateHelper.weekdayNumberToString[date.weekday.toString()]}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Divider(),
          Expanded(child: DateInputForm(date, _submitInputForm)),
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('저장'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}

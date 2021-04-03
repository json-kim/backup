import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/feeling.dart';
import '../screen/diary_screen.dart';
import '../data/diary.dart';
import '../helper/date_helper.dart';
import '../data/diary_provider.dart';

class DateBox extends StatelessWidget {
  final DateTime date;

  Diary diary;

  DateBox({
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    final diaryProvider = Provider.of<DiaryProvider>(context);
    diary = diaryProvider.isInDiaries(date)
        ? diaryProvider.getDiaryWithDate(date)
        : null;

    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          color: diary != null
              ? feelColor[feelings[diary.color]]
              : Colors.grey[300],
          border: DateHelper.dateCompare(date, DateTime.now())
              ? Border.all(width: 0.7)
              : null),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DiaryScreen(date: date, diary: diary)));
        },
        onLongPress: diary == null
            ? null
            : () {
                CoolAlert.show(
                    confirmBtnText: '삭제',
                    cancelBtnText: '취소',
                    confirmBtnColor: Colors.red,
                    backgroundColor: Colors.white,
                    onConfirmBtnTap: () async {
                      //일기삭제
                      await Provider.of<DiaryProvider>(context, listen: false)
                          .removeFromDevice(diary);
                      Navigator.of(context).pop();
                    },
                    onCancelBtnTap: () {
                      //취소
                      Navigator.of(context).pop();
                    },
                    context: context,
                    type: CoolAlertType.confirm,
                    title: '일기 삭제',
                    text: '작성된 일기를 삭제하시겠습니까?');
              },
      ),
    );
  }
}

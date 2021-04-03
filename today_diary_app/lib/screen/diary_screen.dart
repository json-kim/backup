import 'package:cool_alert/cool_alert.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../constants/style.dart';
import '../constants/feeling.dart';
import '../helper/date_helper.dart';
import '../data/diary.dart';
import '../data/diary_provider.dart';

class DiaryScreen extends StatefulWidget {
  static String route = '/diary';
  final DateTime date;
  Diary diary;

  DiaryScreen({@required this.date, this.diary});

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  FocusNode currentFocus = FocusNode();
  TextEditingController _textEditingController = TextEditingController();
  var _isInput = false;
  var _selectedIndex = 0;
  Diary _diary;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    if (widget.diary == null) {
      //print('diary is null');
    } else {
      _diary = widget.diary;
      _selectedIndex = _diary.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context, widget.date),
        body: Center(
          child: _buildBody(context),
        ),
      ),
    ));
  }

  // 다이어리를 저장하는 메소드
  Future<void> saveDiary(
    int colorNum,
    String text,
    DateTime date,
  ) async {
    setState(() {
      _isSaving = true;
    });

    //Provider.of<DiaryProvider>(context, listen: false).isInDiaries(date)
    if (_diary != null) {
      var ans = true;
      await CoolAlert.show(
        onCancelBtnTap: () {
          ans = false;
          Navigator.of(context).pop();
        },
        title: '주의',
        context: context,
        type: CoolAlertType.confirm,
        text: '일기를 덮어 쓰실건가요?',
        confirmBtnText: '예',
        cancelBtnText: '아니오',
        confirmBtnColor: Colors.green,
      );
      if (!ans) return;
    }
    var diary = Diary(
      color: colorNum,
      dateTime: date,
      text: text.trim(),
    );

    try {
      // diary provider를 통해서 일기 저장하기
      await Provider.of<DiaryProvider>(context, listen: false).saveDiary(diary);
      setState(() {
        _diary = diary;
        _isInput = false;
      });
      // 스낵바
      showTopSnackBar(
          context,
          CustomSnackBar(
            message: '저장되었습니다.',
            icon: null,
            backgroundColor: Colors.white,
            key: Key(DateTime.now().toIso8601String()),
          ));
    } catch (e) {
      showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: '저장에 실패하였습니다.',
            key: Key(DateTime.now().toIso8601String()),
          ));
    }
    setState(() {
      _isSaving = false;
    });
  }

  // 앱바
  Widget _buildAppBar(BuildContext context, DateTime date) {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop()),
      actions: [
        // 작성 취소 버튼
        if (_isInput)
          IconButton(
              icon: Icon(
                Icons.undo,
                color: Colors.black,
              ),
              onPressed: () {
                if (_isInput) {
                  setState(() {
                    _isInput = false;
                  });
                  _textEditingController.clear();
                }
              }),
        // 저장 버튼
        IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black,
            ),
            onPressed: () => _isSaving
                ? null
                : saveDiary(
                    _selectedIndex, _textEditingController.text, widget.date)),
      ],
      backgroundColor: Colors.white,
      title: Text(
        '${date.year}년 ${date.month}월 ${date.day}일 (${weekdayKOR[date.weekday]})',
        style: dateColumnText,
      ),
    );
  }

  // 바디
  Widget _buildBody(BuildContext context) {
    return DirectSelectContainer(
      child: Column(
        children: [
          Expanded(flex: 1, child: _buildFeelingColumn()),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: _isInput ? _buildTextInputBox() : _buildTextBox(),
            ),
          ),
        ],
      ),
    );
  }

  // 필링(감정체크) 컬럼
  Widget _buildFeelingColumn() {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DirectSelectList<String>(
                values: feelings,
                defaultItemIndex: _selectedIndex, // 나중에 저장된 feeling 번호변수 넣기
                itemBuilder: (value) => DirectSelectItem<String>(
                  itemHeight: 40,
                  value: value,
                  itemBuilder: (context, value) => Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: feelColor[value],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          value,
                          style: feelingColumnText,
                        ),
                      ),
                    ],
                  ),
                ),
                onItemSelectedListener: (value, index, context) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.unfold_more),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextInputBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: TextField(
        controller: _textEditingController,
        focusNode: currentFocus,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        textInputAction: TextInputAction.newline,
        maxLines: null,
        style: diaryTextStyle,
      ),
    );
  }

  Widget _buildTextBox() {
    return InkWell(
      onTap: () {
        setState(() {
          _isInput = true;
          currentFocus.requestFocus();
        });
      },
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            Text(
              _diary == null || _diary.text == ''
                  ? '오늘의 일기를 작성하세요.'
                  : _diary.text,
              style: diaryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}

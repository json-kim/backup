import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import '../constants/style.dart';
import '../widget/calendar.dart';
import '../widget/drawer_child.dart';
import '../helper/date_helper.dart';

class CalendarScreen extends StatefulWidget {
  static String route = '/calendar';

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  int _currentYear = DateTime.now().year;
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InnerDrawer(
        key: _innerDrawerKey,
        swipe: false,
        onTapClose: true,
        duration: Duration(milliseconds: 200),
        offset: IDOffset.horizontal(0.1),
        proportionalChildArea: true,
        boxShadow: [],
        velocity: 4,
        rightChild: DrawerChild(),
        scaffold: Scaffold(
            backgroundColor: bgColor,
            appBar: _buildAppBar(),
            body: _buildBody()),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: bgColor,
      title: Text('My Calendar', style: appBarTextStyle),
      actions: [
        IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _innerDrawerKey.currentState.toggle();
            })
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 16,
                    onPressed: () {
                      if (_currentYear > DateHelper.minTime.year) {
                        setState(() {
                          _currentYear--;
                          _isChanged = false;
                        });
                      }
                    })),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: Text(_currentYear.toString()),
              ),
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                    iconSize: 16,
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      if (_currentYear < DateHelper.maxTime.year) {
                        setState(() {
                          _currentYear++;
                          _isChanged = true;
                        });
                      }
                    })),
          ],
        ),
        Expanded(
            child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: !_isChanged,
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation) {
            return SharedAxisTransition(
                child: child,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: _transitionType);
          },
          child: Container(
            color: bgColor,
            alignment: Alignment.center,
            child: Calendar(
              year: _currentYear,
            ),
          ),
        ))
      ],
    );
  }
}

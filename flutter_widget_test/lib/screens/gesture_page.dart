import 'package:flutter/material.dart';

import '../widgets/manage_people.dart';

class GestureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ManagePeople(),
      ),
    );
  }

  void removeProduct() {
    // remove product
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/calender_controller.dart';

class CalenderEmptyPage extends GetView<CalenderController> {
  CalenderEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D2F41),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "your training time will appear here!",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Icon(CupertinoIcons.timer, size: 20, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sasha_app/controllers/controller.dart';

class CalenderPage extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Workout 10',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Color(0xFF2D2F41),
      ),
      body: GetBuilder<HomeController>(
        builder: ((controller) {
          return SafeArea(
            child: ListView.builder(
              itemCount: controller.calenderList.length,
              itemBuilder: ((context, index) {
                var calender = controller.calenderList[index];
                var date = calender['dateTime'];
                var start = calender['start'];

                return Card(
                  elevation: 0.5,
                  color: Colors.white,
                  shadowColor: Color(0xFF2D2F41),
                  child: ListTile(
                    title: Text("${date}"),
                    subtitle: Text("${start = 10} Minutes"),
                    dense: true,
                    trailing: Icon(CupertinoIcons.flame, color: Colors.red),
                    visualDensity: VisualDensity.comfortable,
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sasha_app/pages/calender_empty_page.dart';
import 'package:sasha_app/pages/calender_page.dart';
import 'package:sasha_app/widgets/widget_timer.dart';
import '../controllers/controller.dart';

class HomePage extends GetWidget<HomeController> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D2F41),
        elevation: 2,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: () {
                controller.calenderList.isEmpty
                    ? Get.to(() => CalenderEmptyPage())
                    : Get.to(() => CalenderPage());
              },
              icon: Icon(CupertinoIcons.calendar),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Diese App ist kostenlos!",
                    titleStyle: TextStyle(fontSize: 15, color: Colors.blueGrey),
                    // middleText:
                    //     "Unterstützen Sie den Programmierer, um die App zu verbessern",
                    actions: [
                      Text(
                        "mauro.developer.br@gmail.com",
                        style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                      ),
                    ],
                    barrierDismissible: true,

                    content: Text(
                      "Unterstützen Sie den Programmierer, um die App zu verbessern",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    confirm: ElevatedButton.icon(
                      onPressed: () {
                        Clipboard.setData(
                          new ClipboardData(
                              text: "mauro.developer.br@gmail.com"),
                        ).then((_) {
                          Get.snackbar(
                            "",
                            titleText:
                                Text("Vielen Dank für die Unterstützung"),
                            "Paypal-ID erfolgreich kopiert!",
                            icon: Icon(Icons.paypal),
                            backgroundColor: Colors.white,
                            colorText: Colors.black,
                            duration: Duration(seconds: 8),
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        });
                      },
                      icon: Icon(Icons.paypal),
                      label: Text("Kopieren"),
                    ),
                  );
                },
                icon: Icon(Icons.help)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Icon(
                  CupertinoIcons.flame,
                  color: Color.fromARGB(255, 255, 17, 0),
                  size: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Workout 10",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "Start",
                        style: TextStyle(
                            color: Color.fromARGB(255, 230, 135, 135),
                            fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Obx(
                        () => customTimerStart(
                          controller.countDownControllerStart,
                          controller.start.value,
                          () {
                            controller.onCompletedFunction();
                          },
                          () {},
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Pause",
                        style: TextStyle(
                            color: Color.fromARGB(255, 230, 135, 135),
                            fontSize: 15),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Obx(
                          () => customTimerPause(
                            controller.countDownControllerPause,
                            controller.pause.value,
                            () {
                              controller.onCompletedPauseFunction();
                            },
                            () {},
                            controller.autoplay.value,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  controller.startFunction();
                },
                child: Container(
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal,
                        Color.fromARGB(255, 131, 210, 202),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'GO!!!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customDrawer() {
  return Drawer(
    width: Get.width * 0.9,
    child: DrawerHeader(
      decoration: BoxDecoration(),
      child: Container(
          width: Get.width,
          height: 50,
          child: Column(
            children: [
              Icon(Icons.paypal, color: Colors.blue),
              ListTile(
                dense: true,
                title: Text(
                  "Help me to continue the app",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          )),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';

Widget customForm() {
  final _formKey = GlobalKey<FormState>();

  return GetBuilder<HomeController>(
    builder: ((controller) {
      return SingleChildScrollView(
        child: Container(
          child: Wrap(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          label: Text("Add start minutes"),
                          prefixIcon: Icon(CupertinoIcons.timer),
                          errorText: controller.errorText.value,
                        ),
                        onChanged: (value) {
                          controller.start.value = (int.parse(value) * 60);

                          print(
                              "controller.start.value::${controller.start.value}");

                          //   if (int.parse(value) > 0) {
                          //     //controller.setStart = int.parse(value) * 60;
                          //     controller.errorText.value = "";
                          //     print("TextField VALUE::${controller.getStart}");
                          //     controller.setIsValidFom = true;
                          //   } else {
                          //     controller.setIsValidFom = false;
                          //
                          //     print("VALUE TEXT $value");
                          //     return null;
                          //   }
                        },
                      ),

                      ///
                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   decoration: InputDecoration(
                      //     label: Text("Add break minutes"),
                      //     prefixIcon: Icon(CupertinoIcons.pause_circle),
                      //   ),
                      //   validator: (value) {
                      //     if (!value!.isNumericOnly) {
                      //       return 'Please, only number';
                      //     }
                      //     return null;
                      //   },
                      // ),

                      ///
                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   decoration: InputDecoration(
                      //     label: Text("Set the break ends alarm"),
                      //     prefixIcon: Icon(CupertinoIcons.refresh),
                      //   ),
                      //   validator: (value) {
                      //     if (!value!.isNumericOnly) {
                      //       return 'Please, only number';
                      //     }
                      //     return null;
                      //   },
                      // ),

                      ///Button///
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        height: 100,
                        width: 200,
                        child: ElevatedButton(
                            child: Icon(CupertinoIcons.timer),
                            onPressed: () {
                              Get.back();
                            }
                            //   : null,
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_kelaskiwari/app/data/constants/color_constant.dart';
import 'package:quiz_kelaskiwari/app/helpers/screen_helper.dart';
import 'package:quiz_kelaskiwari/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHelper = ScreenHelper(context);
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "QUIZ",
                  style: TextStyle(
                      fontSize: screenHelper.getTextSize(90),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Nunito',
                      color: primaryColor),
                ),
                Text(
                  "KIWARI",
                  style: TextStyle(
                      fontSize: screenHelper.getTextSize(60),
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                )
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenHelper.getSize(30)),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.QUIZ);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHelper.getSize(10),
                  ),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(screenHelper.getSize(15)),
                      border: Border.all(width: 3, color: Color(0xFFDDDDDD))),
                  child: Center(
                      child: Text(
                    "MULAI",
                    style: TextStyle(
                        fontSize: screenHelper.getTextSize(25),
                        fontWeight: FontWeight.w900,
                        color: primaryColor),
                  )),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_kelaskiwari/app/data/constants/color_constant.dart';

import '../controllers/score_controller.dart';

class ScoreView extends GetView<ScoreController> {
  const ScoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    int score = int.parse(argument['score']);

    Color scoreColor() {
      if (score < 51) {
        return Colors.red;
      } else if (score < 76) {
        return Colors.orange;
      }
      return primaryColor;
    }

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Skor Anda',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: scoreColor(), width: 4),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  child: Text(
                    '${score}',
                    style: TextStyle(
                        fontSize: 90,
                        color: scoreColor(),
                        fontWeight: FontWeight.w900),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

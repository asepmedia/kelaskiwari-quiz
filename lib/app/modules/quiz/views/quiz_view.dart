import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:quiz_kelaskiwari/app/data/constants/color_constant.dart';
import 'package:quiz_kelaskiwari/app/helpers/screen_helper.dart';
import 'package:quiz_kelaskiwari/app/routes/app_pages.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHelper = ScreenHelper(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Quiz Kiwari',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Obx(() => Text(
                '(${controller.duration})',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ))
        ]),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenHelper.getTextSize(20)),
                    child: Column(
                      children: [
                        Container(
                          height: screenHelper.getHeight(200),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 3, color: primaryColor),
                              borderRadius: BorderRadius.circular(
                                  screenHelper.getTextSize(20))),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenHelper.getTextSize(15),
                                  vertical: screenHelper.getTextSize(10)),
                              child: Obx(() => Text(
                                    "${controller.currentQuestion.question}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHelper.getTextSize(20)),
                    child: Column(
                      children: [
                        Text("Pilih jawaban Anda"),
                        SizedBox(
                          height: screenHelper.getHeight(20),
                        ),
                        GetBuilder<QuizController>(
                            id: "LIST_OPTION",
                            builder: (controller) {
                              return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .currentQuestion.options!.length,
                                  itemBuilder: ((context, index) {
                                    var option = controller
                                        .currentQuestion.options![index];
                                    return InkWell(
                                      onTap: () {
                                        controller.setOption(index);
                                      },
                                      child: Column(
                                        children: [
                                          OptionAnswer(
                                            text: option.text,
                                            isSelected:
                                                controller.selectedOption ==
                                                    index,
                                          ),
                                          SizedBox(
                                            height: screenHelper.getHeight(10),
                                          ),
                                        ],
                                      ),
                                    );
                                  }));
                            })
                      ],
                    ),
                  )
                ],
              ),
              Obx(
                () => InkWell(
                  onTap: (() {
                    controller.nextQuestion();
                  }),
                  child: Opacity(
                    opacity: controller.selectedOption > 4 ? 0.2 : 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: primaryColor),
                      child: SafeArea(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Text(
                            "Selanjutnya",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 1,
                                color: Colors.white),
                          ),
                        ),
                      )),
                    ),
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

class OptionAnswer extends StatelessWidget {
  String? text;
  bool? isSelected;
  OptionAnswer({Key? key, this.isSelected, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHelper = ScreenHelper(context);
    _isSelected() {
      return isSelected != null ? (isSelected!) : false;
    }

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: _isSelected() ? primaryColor : Color(0xFF909090),
              width: 1.5),
          borderRadius: BorderRadius.circular(screenHelper.getTextSize(10))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenHelper.getTextSize(10),
            vertical: screenHelper.getTextSize(10)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  _isSelected() ? primaryColor : Colors.grey.shade200,
              maxRadius: screenHelper.getTextSize(18),
            ),
            SizedBox(
              width: screenHelper.getHeight(10),
            ),
            Expanded(
                child: Text(
              "$text",
              style: TextStyle(
                  fontSize: screenHelper.getTextSize(14.5),
                  color: _isSelected() ? primaryColor : Colors.black87,
                  fontWeight:
                      _isSelected() ? FontWeight.bold : FontWeight.w400),
            ))
          ],
        ),
      ),
    );
  }
}

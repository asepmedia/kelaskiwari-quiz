import 'dart:async';

import 'package:get/get.dart';
import 'package:quiz_kelaskiwari/app/data/models/option_model.dart';
import 'package:quiz_kelaskiwari/app/data/models/question_model.dart';
import 'package:quiz_kelaskiwari/app/routes/app_pages.dart';

class QuizController extends GetxController {
  //TODO: Implement QuizController

  var duration = 5.obs;
  var _currentQuestion = 0.obs;
  var _selectedOption = 5.obs;
  var questions = <QuestionModel>[].obs;
  var correct = <QuestionModel>[].obs;
  var wrong = <QuestionModel>[].obs;

  Timer? countdownTimer;

  @override
  void onInit() {
    super.onInit();

    questions.add(QuestionModel(
        question: "Kepanjangan dari HTML?",
        correctAnswer: 0,
        options: [
          OptionModel(text: "Hypertext Markup Language"),
          OptionModel(text: "Hypermakeup Markup Language"),
          OptionModel(text: "Hyper Markup Language"),
          OptionModel(text: "Hahahihi Markup Language")
        ]).setDuration(10));

    questions.add(QuestionModel(
        question: "Flutter & Dart digunakan untuk?",
        correctAnswer: 0,
        options: [
          OptionModel(text: "Membuat Aplikasi Mobile"),
          OptionModel(text: "Membuat Aplikasi Web"),
          OptionModel(text: "Membuat REST API"),
          OptionModel(text: "Membuat Koneksi Database")
        ]).setDuration(15));

    questions.add(QuestionModel(
        question: "CSS digunakan untuk?",
        correctAnswer: 1,
        options: [
          OptionModel(text: "Styling Alis"),
          OptionModel(text: "Styling Website"),
          OptionModel(text: "Styling Rambut"),
          OptionModel(text: "Semua Benar")
        ]).setDuration(5));

    questions.add(QuestionModel(
        question: "Kepanjangan dari DOM?",
        correctAnswer: 1,
        options: [
          OptionModel(text: "Data Object Model"),
          OptionModel(text: "Document Object Model"),
          OptionModel(text: "Data Offline Market"),
          OptionModel(text: "Semua Salah")
        ]).setDuration(20));
  }

  @override
  void onReady() {
    super.onReady();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
  }

  QuestionModel get currentQuestion {
    if (questions.length <= 0) return QuestionModel();
    return questions[_currentQuestion.value];
  }

  int get selectedOption {
    return _selectedOption.value;
  }

  bool get isLastQuestion {
    return _currentQuestion == questions.length - 1;
  }

  void startTimer() {
    duration.value = currentQuestion.duration;
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      setCountDown();
      print("Start");
    });
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    int seconds = duration.value - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
      nextQuestion();
    } else {
      duration.value = seconds;
    }
  }

  void clearSelectedOption() {
    _selectedOption.value = 5;
  }

  void setOption(int index) {
    _selectedOption.value = index;
    questions[_currentQuestion.value].selectedOption = index;
    update(["LIST_OPTION"], true);
  }

  void nextQuestion() {
    // jalankan next question
    if (!isLastQuestion) {
      _currentQuestion.value = _currentQuestion.value + 1;
      clearSelectedOption();
      startTimer();
      update(["LIST_OPTION"], true);
    } else {
      correct.value =
          questions.where((e) => e.selectedOption == e.correctAnswer).toList();
      wrong.value =
          questions.where((e) => e.selectedOption != e.correctAnswer).toList();

      print("correct ${correct.length}");
      print("wrong ${wrong.length}");

      var score = (correct.length / questions.length) * 100;
      if (correct.length <= 0) {
        score = 0;
      }

      Get.toNamed(Routes.SCORE,
          arguments: {"score": "${score.toStringAsFixed(0)}"});
    }
  }
}

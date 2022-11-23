import 'package:quiz_kelaskiwari/app/data/models/option_model.dart';

class QuestionModel {
  String? question;
  int? correctAnswer;
  int? selectedOption;
  int duration = 30;
  List<OptionModel>? options;

  QuestionModel(
      {this.question, this.correctAnswer, this.options, this.selectedOption});
}

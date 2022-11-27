import 'package:quiz_wizard/models/quiz_answer_model.dart';

class QuizQuestionModel {
  List<QuizAnswerModel> choices;
  String question;
  final String imgURL;
  QuizQuestionModel(
      {required this.choices, this.question = "", this.imgURL = ""});
  void addAnswer(QuizAnswerModel ans) {
    ans.setIndex(choices.length);
    choices.add(ans);
  }

  List<QuizQuestionModel> getQuestions() {
    List<QuizAnswerModel> answerChoices =
        QuizAnswerModel(ans: "", isCorrect: false).getAnswers();
    List<QuizQuestionModel> questions = [];
    questions.add(QuizQuestionModel(
        choices: answerChoices,
        question: "Which nation won the 1975 cricket world cup?",
        imgURL: "assets/cricket.png"));
    questions.add(QuizQuestionModel(
        choices: answerChoices,
        question: "Which nation won the 1975 cricket world cup?",
        imgURL: "assets/cricket.png"));
    questions.add(QuizQuestionModel(
        choices: answerChoices,
        question: "Which nation won the 1975 cricket world cup?",
        imgURL: "assets/cricket.png"));
    questions.add(QuizQuestionModel(
        choices: answerChoices,
        question: "Which nation won the 1975 cricket world cup?",
        imgURL: "assets/cricket.png"));
    questions.add(QuizQuestionModel(
        choices: answerChoices,
        question: "Which nation won the 1975 cricket world cup?",
        imgURL: "assets/cricket.png"));
    return questions;
  }

  QuizQuestionModel.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        imgURL = json['imgURL'],
        choices = [] {
    for (int i = 0; i < json['choices'].length; i++) {
      QuizAnswerModel ans = QuizAnswerModel.fromJson(json['choices'][i]);
      ans.setIndex(
          i); //remember to update index of choices whenever a choice is added to the question
      choices.add(ans);
    }
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    List<Map<String, dynamic>> _choices = [];
    _data['question'] = question;
    for (int i = 0; i < choices.length; i++) {
      _choices.add(choices[i].toJson());
    }
    _data['choices'] = _choices;
    return _data;
  }
}

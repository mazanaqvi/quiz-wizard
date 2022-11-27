import 'package:get/get.dart';
import 'package:quiz_wizard/models/quiz_question_model.dart';

class QuizModel {
  List<QuizQuestionModel> allQuestions;
  final String id;
  QuizModel(this.allQuestions, this.id);
  RxInt currentQuestionIndex = 0.obs;
  int score = 0;
  void addQuestion(QuizQuestionModel question) {
    allQuestions.add(question);
  }

  QuizModel getQuiz() {
    List<QuizModel> quizes = [];
    List<QuizQuestionModel> quizQuestions = [];

    quizQuestions = QuizQuestionModel(choices: [], question: "").getQuestions();
    quizes.add(QuizModel(quizQuestions, "1"));
    quizes.add(QuizModel(quizQuestions, "2"));
    quizes.add(QuizModel(quizQuestions, "3"));
    quizes.add(QuizModel(quizQuestions, "4"));
    return quizes[0];
  }

  void nextQuestion() {
    currentQuestionIndex.value++;
  }

  bool isNextQuestionAvailable() {
    return currentQuestionIndex.value < allQuestions.length;
  }

  QuizQuestionModel getCurretntQuestion() {
    if (allQuestions.isNotEmpty) {
      return allQuestions[currentQuestionIndex.value];
    } else {
      return QuizQuestionModel(choices: [], question: "");
    }
  }

  void printAllQuestionStatement() {
    for (int i = 0; i < allQuestions.length; i++) {}
  }

  void resetCouter() {
    currentQuestionIndex.value = 0;
  }

  bool isFinished() {
    return currentQuestionIndex.value == allQuestions.length;
  }
}

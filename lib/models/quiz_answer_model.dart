class QuizAnswerModel {
  final String ans;
  final bool isCorrect;
  int choiceIndex = 0;
  int? index;
  QuizAnswerModel(
      {required this.choiceIndex, required this.ans, required this.isCorrect});
  void setIndex(int index) {
    this.index = index;
  }

  List<QuizAnswerModel> getAnswers() {
    List<QuizAnswerModel> answers = [];
    answers.add(QuizAnswerModel(
      choiceIndex: 1,
      ans: "A. India",
      isCorrect: false,
    ));
    answers.add(
        QuizAnswerModel(choiceIndex: 2, ans: "B. Australia", isCorrect: true));
    answers.add(QuizAnswerModel(
        choiceIndex: 3, ans: "C. West Indies", isCorrect: false));
    answers.add(
        QuizAnswerModel(choiceIndex: 4, ans: "D. England", isCorrect: false));
    return answers;
  }

  QuizAnswerModel.fromJson(Map<String, dynamic> json)
      : ans = json['ans'],
        isCorrect = json['isCorrect'];
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ans'] = ans;
    choiceIndex:
    2;
    _data['isCorrect'] = isCorrect;
    return _data;
  }
}

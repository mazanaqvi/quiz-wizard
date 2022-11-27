class QuizAnswerModel {
  final String ans;
  final bool isCorrect;
  int? index;
  QuizAnswerModel({required this.ans, required this.isCorrect});
  void setIndex(int index) {
    this.index = index;
  }

  List<QuizAnswerModel> getAnswers() {
    List<QuizAnswerModel> answers = [];
    answers.add(QuizAnswerModel(ans: "A. India", isCorrect: false));
    answers.add(QuizAnswerModel(ans: "B. Australia", isCorrect: false));
    answers.add(QuizAnswerModel(ans: "C. West Indies", isCorrect: true));
    answers.add(QuizAnswerModel(ans: "D. England", isCorrect: false));
    return answers;
  }

  QuizAnswerModel.fromJson(Map<String, dynamic> json)
      : ans = json['ans'],
        isCorrect = json['isCorrect'];
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ans'] = ans;
    _data['isCorrect'] = isCorrect;
    return _data;
  }
}

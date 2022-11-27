import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_wizard/models/quiz.dart';
import 'package:quiz_wizard/models/quiz_answer_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:quiz_wizard/models/quiz_question_model.dart';
import 'package:quiz_wizard/views/general_widgets/appbar.dart';
import 'package:quiz_wizard/views/general_widgets/general_info.dart';

import 'styles.dart';

int score = 0;

class McqQuiz extends StatefulWidget {
  const McqQuiz({Key? key}) : super(key: key);

  @override
  _McqQuizState createState() => _McqQuizState();
}

class _McqQuizState extends State<McqQuiz> {
  int selectedAnswerId = -1;
  bool readMore = true;
  bool showResult = false;
  late QuizModel quiz;
  //diMe1oJLBWz9bV05fA0D quiz ID in firebase
  QuizQuestionModel question =
      QuizQuestionModel(choices: [], question: "this is a question");
  @override
  void initState() {
    score = 0;
    quiz = QuizModel([], "1").getQuiz();
    quiz.resetCouter();
    question = quiz.getCurretntQuestion();
    quiz.printAllQuestionStatement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("assets/time.png"),
                const Padding(
                  padding: EdgeInsets.only(top: 48.0, left: 40),
                  child: SizedBox(
                    width: 50,
                    child: Text(
                      "02:14 MIN",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            quiz.isFinished()
                ? Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 32.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Quiz"),
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'آپ نے ${quiz.allQuestions.length} میں سے $score سوالوں کا صحیح جواب دیا ہے۔',
                          style: boldHeadingText().copyWith(color: mainColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shadowColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            ' واپس جائیں',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  )
                :
// question != null?
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Center(
                            child: Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Q${quiz.currentQuestionIndex.value + 1}/ ',
                                    style: boldHeadingText()
                                        .copyWith(color: mainColor),
                                  ),
                                  Text(
                                    '${quiz.allQuestions.length} ',
                                    style: boldHeadingText()
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        question.imgURL != null
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Center(
                                  child: Image.asset(question
                                          .imgURL //can't be null alrady checked
                                      ),
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              quiz.allQuestions[quiz.currentQuestionIndex.value]
                                  .question,
                              textAlign: TextAlign.center,
                              style: boldHeadingText(),
                            ),
                          ),
                        ),
                        Center(
                          child: DotsIndicator(
                            dotsCount: quiz.allQuestions.length,
                            position:
                                quiz.currentQuestionIndex.value.toDouble(),
                            decorator: DotsDecorator(
                              color: greyColor, // Inactive color
                              activeColor: mainColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Center(
                            child: Text(
                              "Select Answer Below",
                              textAlign: TextAlign.center,
                              style: boldHeadingText()
                                  .copyWith(color: mainColor, fontSize: 20),
                            ),
                          ),
                        ),
                        Obx(
                          () => Column(
                            children: quiz
                                .allQuestions[quiz.currentQuestionIndex.value]
                                .choices
                                .map(
                                  (choice) => Column(
                                    children: [
                                      AnswerTile(
                                        answer: QuizAnswerModel(
                                            ans: choice.ans,
                                            isCorrect: choice.isCorrect),
                                        isSelected:
                                            selectedAnswerId == choice.index,
                                        onPressed: () async {
                                          if (selectedAnswerId != -1) {
                                            return;
                                          }
                                          await _handleSelection(choice);
                                        },
                                        showResult: showResult,
                                        isCorrect: choice.isCorrect,
                                        animatedContainerDuration:
                                            const Duration(milliseconds: 300),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () => {},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Previous"),
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          secondaryColor),
                                ),
                                onPressed: () => {},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Previous"),
                                )),
                          ],
                        ),
                        const GeneralInfo()
                      ],
                    ),
                  )
            // : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSelection(QuizAnswerModel choice) async {
    setState(() {
      selectedAnswerId = choice.index ?? -1;
      showResult = true;
    });
    await Future.delayed(const Duration(milliseconds: 1500), () {
      quiz.nextQuestion();
      debugPrint('selected answer: ${choice.index}');
      setState(() {
        selectedAnswerId = -1;
        showResult = false;
      });
    });
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.answer,
    required this.isSelected,
    required this.showResult,
    required this.isCorrect,
    required this.onPressed,
    required this.animatedContainerDuration,
  }) : super(key: key);

  final QuizAnswerModel answer;
  final bool isSelected;
  final bool showResult;
  final bool isCorrect;
  final Function() onPressed;
  final Duration animatedContainerDuration;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !showResult ? onPressed : null,
      child: AnimatedContainer(
        duration: animatedContainerDuration,
        curve: Curves.fastOutSlowIn,
        decoration: _buildAnswerDecoration(context),
        padding: EdgeInsets.symmetric(
            vertical: isSelected || (showResult && isCorrect) ? 16.0 : 8.0),
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(color: greyColor),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                child: _buildAnswerIcon(context),
              ),
              Expanded(
                child: Text(
                  answer.ans,
                  style: regularText().copyWith(
                    fontSize: 20,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerIcon(BuildContext context) {
    if (showResult && isCorrect) {
      return Icon(
        Icons.check,
        color: isSelected ? Colors.green : const Color(0xFFFED766),
        size: 26,
      );
    }

    if (isSelected) {
      return Center(
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      );
    }

    return Container();
  }

  BoxDecoration _buildAnswerDecoration(BuildContext context) {
    BoxDecoration decoration = const BoxDecoration();
    if (!showResult) {
      if (isSelected) {
        decoration =
            roundSimpleBoxDecoration().copyWith(color: const Color(0xFFFED766));
      }
    } else {
      if (isSelected && isCorrect) {
        score++;
        decoration = roundSimpleBoxDecoration().copyWith(color: Colors.green);
      } else if (isSelected && !isCorrect) {
        decoration =
            roundSimpleBoxDecoration().copyWith(color: const Color(0xFFFE4A49));
      } else if (!isSelected && isCorrect) {
        decoration = roundSimpleBoxDecoration().copyWith(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.21));
      }
    }
    return decoration;
  }
}

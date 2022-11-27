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

class DetailQuiz extends StatefulWidget {
  const DetailQuiz({Key? key}) : super(key: key);

  @override
  _DetailQuizState createState() => _DetailQuizState();
}

class _DetailQuizState extends State<DetailQuiz> {
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
            !quiz.isFinished()
                ? Row(
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
                      const Text(
                        "TIME REMAINING",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : Container(),
            quiz.isFinished()
                ? Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Text(
                            "Result",
                            style: boldHeadingText().copyWith(color: mainColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        'You answerd right $score  out of ${quiz.allQuestions.length} ',
                        style: boldHeadingText().copyWith(color: mainColor),
                        textAlign: TextAlign.center,
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
                            ' Go Back',
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
                        Obx(
                          () => Center(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Center(
                            child: Text(
                              "Type Answer Below",
                              textAlign: TextAlign.center,
                              style: boldHeadingText()
                                  .copyWith(color: mainColor, fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFE5E5E5),
                              hintText: "Type",
                              hintStyle: regularText(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () => {
                                      if (quiz.currentQuestionIndex > 1)
                                        {quiz.currentQuestionIndex--},
                                    },
                                child: const SizedBox(
                                    width: 80,
                                    child: Center(child: Text("Previous")))),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          secondaryColor),
                                ),
                                onPressed: () => {
                                      if (quiz.currentQuestionIndex <
                                          quiz.allQuestions.length - 1)
                                        {quiz.currentQuestionIndex++},
                                    },
                                child: const SizedBox(
                                    width: 80,
                                    child: Center(child: Text("Next")))),
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
}

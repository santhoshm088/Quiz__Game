import 'package:adv/answers_button.dart';
import 'package:adv/data/questions.dart';
import 'package:adv/page/displaypage.dart';
import 'package:flutter/material.dart';
import 'package:adv/page/page.dart';
import "package:google_fonts/google_fonts.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answers) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;


  void answerQuestion(String selectAnswer) {
    widget.onSelectAnswer(selectAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  void ActivatePage(String a) {
    setState(() {
      var myInt = int.parse(a);
      currentQuestionIndex = myInt - 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    final List<String> currentpage = page;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffle().map((answers) {
              return Answers(
                  answers: answers,
                  onTap: () {
                    answerQuestion(answers);
                  });
            }),
            const SizedBox(
              height: 110,
            ),
            Container(
              // decoration: BoxDecoration(gradient: LinearGradient(colors: Colors.accents)),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...currentpage.map((page) {
                    return Display(page, ActivatePage);
                  }),
                ],
              ),
            ),
            
     
          ],
        ),
      ),
    );
  }
}

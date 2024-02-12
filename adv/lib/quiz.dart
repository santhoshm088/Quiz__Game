import 'package:adv/data/questions.dart';
import 'package:adv/gradient.dart';
import 'package:adv/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activateScreen;

  List<String> selectedAnswers = [];

  @override
  void initState() {
    activateScreen = StartScreen(switchscreen);
    super.initState();
  }

  void chooseAnswers(String answers) {
    selectedAnswers.add(answers);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activateScreen =
            Resetscreen(reset: ResetPage, chosenanswers: selectedAnswers);
      });
    }
  }

  void switchscreen() {
    setState(() {
      activateScreen = QuestionScreen(
        onSelectAnswer: chooseAnswers,
      );
    });
  }

  void ResetPage() {
    selectedAnswers = [];
    setState(() {
      activateScreen = StartScreen(switchscreen);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: activateScreen,
      ),
    ));
  }
}

import 'package:adv/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv/questions_summary.dart';

class Resetscreen extends StatelessWidget {
  Resetscreen({super.key, required this.reset, required this.chosenanswers});

  final void Function() reset;
  final List<String> chosenanswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenanswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'user_answers': chosenanswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['correct_answers'] == data['user_answers'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("You answered $numCorrectQuestions out of $numTotalQuestions correctly",
          style: const TextStyle(color: Color.fromARGB(255, 54, 174, 244),fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(getSummaryData()),
          TextButton.icon(
            onPressed: reset,
            icon: const Icon(Icons.restart_alt_rounded),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text("Restart Quiz"),
          )
        ]),
      ),
    );
  }
}

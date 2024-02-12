import 'package:adv/data/questions.dart';
import 'package:adv/question_screen.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary( this.summaryData ,{super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
     child: SingleChildScrollView(
      
       child: Column(
        
        children: summaryData.map((data) {
          return  Row(
            
            children: [
              
            
            Padding(
              padding: const EdgeInsets.only(left:15, bottom: 35, right: 20, top:0),
              child: Container( width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                color: const Color.fromARGB(255, 0, 191, 255),
                borderRadius: BorderRadius.circular(100),
              ),
                child: Text(((data['question_index'] as int) + 1).toString())),
            ),
        Expanded(child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['question'] as String,style: const TextStyle(color: Color.fromARGB(255, 239, 236, 232),fontSize: 20),),
                const SizedBox(height: 5,),
                Text("Your Answer : ${data['user_answers'] as String} ",style: const TextStyle(color: Color.fromARGB(255, 215, 47, 9),fontSize: 18),),
                
                Text("Correct Answer : ${data['correct_answers'] as String} ",style: const TextStyle(color: Color.fromARGB(255, 29, 107, 36),fontSize: 18),),
     
              ],
            ),
        )
          ],);
        }).toList(),
         
        

        ),
     )
     
    );
  }
}

import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
   Answers( {super.key,required this.answers, required this.onTap});

  final String answers;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          backgroundColor: const Color.fromARGB(255, 21, 143, 204),
          foregroundColor: const Color.fromARGB(255, 6, 45, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50), ),
        ),
        child:  Text(answers,style: const TextStyle(fontSize: 15,),
        textAlign: TextAlign.center,)
      ),
    );
  }
}

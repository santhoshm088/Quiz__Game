import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  Display(this.page, this.pageactivate, {super.key});

  final String page;

  final void Function(String a) pageactivate;

  @override
  Widget build(context) {
    return Container(
      child: Expanded(
        child: TextButton(
          onPressed: () {
            pageactivate(page);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 4),
            foregroundColor: Colors.white,
          ),
          child: Text(page),
        ),
      ),
    );
  }
}

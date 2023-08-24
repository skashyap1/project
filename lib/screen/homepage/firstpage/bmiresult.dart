import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RESULTPAGE extends StatelessWidget {
  final double BMIVALUE ;
  RESULTPAGE({super.key, required this.BMIVALUE});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "THIS IS YOUR BMI",
                  style: GoogleFonts.abel(fontSize: 40),
                ),
                Text(
                  "BMI: ${BMIVALUE.toString().substring(0, 5)}",
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

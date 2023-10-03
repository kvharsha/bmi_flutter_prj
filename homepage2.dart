import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage2 extends StatefulWidget {
  final double? bmi; // Define the BMI variable as a class property

  const Homepage2({Key? key,required this.bmi}) : super(key: key);

  @override
  _Homepage2State createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa0c2c2),
      appBar: AppBar(
        backgroundColor: const Color(0xff008080),
        title: Text(
          "Your BMI",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200,),
            widget.bmi != null
                ? Text(
              "BMI is ${widget.bmi!.toStringAsFixed(2)}",
              style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
                : Container(),
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}


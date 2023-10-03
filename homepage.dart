import 'package:bmi_flutter_prj/homepage2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

 class _HomePageState extends State<HomePage>{
   final TextEditingController _weightController = TextEditingController();
   final TextEditingController _heightController = TextEditingController();
   double? bmi;
   Color? color1;
   void _computebmi(){
     if ( _weightController.text.isEmpty || _heightController.text.isEmpty){
       setState(() {
         bmi = null;
       });
       return;
     }

     final weight= double.tryParse(_weightController.text);
     final height=double.tryParse(_heightController.text);

     if (weight== null || height==null){
       setState(() {
         bmi = null;
       });
       return;
     }

     final bmiValue = weight /((height/100)*(height/100));

     setState(() {
       bmi = bmiValue;
       if (bmiValue < 17.5) {
         color1 = Colors.red;
       } else if (bmiValue >= 18.5 && bmiValue < 25) {
         color1 = Colors.black;
       } else if (bmiValue >= 25 && bmiValue < 30) {
         color1 = Colors.orange;
       } else if (bmiValue >= 30) {
         color1 = Colors.red;
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffa0c2c2),
        appBar: AppBar(
          backgroundColor: const Color(0xff008080),
          title: Text(
            "BMI Calculator",
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 220,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff66b2b2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          color: Colors.white.withOpacity(0.8),
                          child: TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "Enter Weight",
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Enter Weight (in kg)",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                      ],
                   
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 220,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff66b2b2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          color: Colors.white.withOpacity(0.8),
                          child: TextField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "Enter Height",
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "Enter Height (in cm)",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                      ],
                    
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                ElevatedButton(
                  onPressed:() {
                    _computebmi();

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage2(bmi: bmi)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                    child:Text(
                  "Compute",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                    ),
                  ),
                )

                ),
              ],
            ),
            ),
        );
    }
}
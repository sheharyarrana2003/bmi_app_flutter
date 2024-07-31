import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtControler=TextEditingController();
  var ftControler=TextEditingController();
  var inControler=TextEditingController();
  var result="";
  Color bgColor=Colors.yellow.shade200;
  String Calculations(String weight,String feet,String inches){
      if(weight.isEmpty || feet.isEmpty || inches.isEmpty){
        bgColor=Colors.yellow.shade200;
          return"Please fill all fields";
    }
      var wt=int.parse(weight);
      var ft=int.parse(feet);
      var inh=int.parse(inches);

      var tInch=(ft*12) + inh;
      var tCm=tInch*2.54;
      var tM=tCm/100;
      var bmi=wt/(pow(tM, 2));
      String bmiCategory="";

      if(bmi>25){
        bmiCategory="You are Over Weight";
        bgColor=Colors.orange.shade200;
      }
      else if(bmi<18){
        bmiCategory="You are Under Weight";
        bgColor=Colors.red.shade200;
      }
      else{
        bmiCategory="You are Healthy";
        bgColor=Colors.green.shade200;
      }

      return "($bmiCategory) \n Your BMI is ${bmi.toStringAsFixed(2)}";


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator",style: TextStyle(fontWeight:FontWeight.bold),)),
        backgroundColor:Colors.yellow,
      ),
      body: Container(
        color: bgColor,
        child: Padding(
          padding: EdgeInsets.all(21),
          child: Column(
            children: [
              Center(
                child: Text("Please Enter desired fields",style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: wtControler,
                decoration: InputDecoration(
                  label: Text("Enter your Weigth in KG's "),
                  prefixIcon: Icon(Icons.line_weight_rounded,color: Colors.blue,),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10,),
              TextField(
                controller: ftControler,
                decoration: InputDecoration(
                  label: Text("Enter your height in Feets "),
                  prefixIcon: Icon(Icons.height,color: Colors.blue,),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10,),
              TextField(
                controller: inControler,
                decoration: InputDecoration(
                  label: Text("Enter your height in Inches "),
                  prefixIcon: Icon(Icons.height,color: Colors.blue,),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                result=Calculations(wtControler.text.toString(), ftControler.text.toString(), inControler.text.toString());
              setState(() {

              });
                }, child: Text("Calculate")),
              SizedBox(height: 11,),
              Text(result)
            ],
          ),
        ),
      ),

    );
  }
}

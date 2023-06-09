import 'package:flutter/material.dart';

import 'categoriespage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  final GlobalKey<FormState> bmiFormKey = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  var currentBmiButtonMessage = "Calculate your BMI";
  Color currentBmiTextColor = Colors.white;
  Color currentBmiButtonColor01 = Colors.cyan;
  Color currentBmiButtonColor02 = Colors.cyanAccent;

  var userWeight = 0.0;
  var userHeight = 0.0;
  var bmiCalculation = 0.0;
  var bmiResult = "0.0";
  var bmiSituation = "?";

  Color currentMaleIconColor = Colors.blue;
  Color currentMaleTextColor = Colors.black87;

  Color currentFemaleIconColor = Colors.black12;
  Color currentFemaleTextColor = Colors.black12;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: const Text(
          "Your body",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14.0,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleSpacing: 20,
            title: const Text(
              "BMI Calculator",
              style: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => CategoriesPage()
                    )
                  );
                },
                child: const Icon(
                  Icons.info
                ),
                style: const ButtonStyle(
                  iconColor: MaterialStatePropertyAll<Color>(Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Ink(
                      padding: const EdgeInsets.all(10.0),
                      decoration: ShapeDecoration(
                        color: currentMaleIconColor,
                        shape: CircleBorder()
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            currentMaleIconColor = Colors.blue;
                            currentMaleTextColor = Colors.black87;

                            currentFemaleIconColor = Colors.black12;
                            currentFemaleTextColor = Colors.black12;
                          });
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Male",
                    style: TextStyle(
                      color: currentMaleTextColor,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Ink(
                      padding: const EdgeInsets.all(10.0),
                      decoration: ShapeDecoration(
                        color: currentFemaleIconColor,
                        shape: CircleBorder()
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            currentFemaleIconColor = Colors.pink;
                            currentFemaleTextColor = Colors.black87;

                            currentMaleIconColor = Colors.black12;
                            currentMaleTextColor = Colors.black12;
                          });
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Female",
                    style: TextStyle(
                      color: currentFemaleTextColor,
                      fontSize: 14.0
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Your weight ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0
                            ),
                          ),
                          TextSpan(
                            text: "(kg)",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Your height ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0
                            ),
                          ),
                          TextSpan(
                            text: "(cm)",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Form(
                key: bmiFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: SizedBox(
                            height: 40.0,
                            width: 100.0,
                            child: TextFormField(
                              controller: weightController,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return "Empty field!";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: SizedBox(
                            height: 40.0,
                            width: 100.0,
                            child: TextFormField(
                              controller: heightController,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return "Empty field!";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: currentBmiButtonColor01,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 1.0,
                            color: currentBmiButtonColor02
                          ),
                        ),
                        child: SizedBox(
                          height: 50.0,
                          width: 260.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if(bmiFormKey.currentState!.validate()) {
                                  currentBmiButtonMessage = "Calculate BMI again";
                                  currentBmiTextColor = Colors.cyan;
                                  currentBmiButtonColor01 = Colors.transparent;
                                  currentBmiButtonColor02 = Colors.transparent;

                                  userWeight = double.parse(weightController.text);
                                  userHeight = double.parse(heightController.text);
                                  bmiCalculation = userWeight / (userHeight * userHeight);
                                  bmiResult = (bmiCalculation).toStringAsFixed(1);
                          
                                  if(bmiCalculation >= 30) {
                                    bmiSituation = "Obese";
                                  }else if(bmiCalculation >= 25) {
                                    bmiSituation = "Overweight";
                                  }else if(bmiCalculation >= 18.5) {
                                    bmiSituation = "Normal";
                                  }else {
                                    bmiSituation = "Underweight";
                                  }
                                }
                              });
                            },
                            child: Text(
                              "$currentBmiButtonMessage",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: currentBmiTextColor
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                      height: 20.0,
                    ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Your BMI",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "$bmiResult",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                    Text(
                      "$bmiSituation",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
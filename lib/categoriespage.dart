import 'package:flutter/material.dart';

import 'homepage.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage()
              )
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 1.0,
            color: Colors.black12
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Divider(
                height: 1.0,
                thickness: 3.0,
                indent: 160.0,
                endIndent: 160.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "BMI Categories",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Less than 18.5",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    "you're underweight.",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "18.5 to 24.9",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    "you're normal.",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "25 to 29.9",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    "you're overweight.",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "30 or more",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    "obesity.",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
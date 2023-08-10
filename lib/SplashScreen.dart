import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/CreatLogin.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.shade300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Lottie.asset('img/animation_lkb9nmr9.json',),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80.0),
                          topRight: Radius.circular(80.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Welcome to ToDo App",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.deepPurpleAccent.shade400
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(" Todo apps often include priority settings, allowing "
                                "users to categorize tasks by urgency or importance.",style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey.shade500
                            ),),
                          ),
                          SizedBox(height: 50.0),
                          Container(
                            height: 50.0,
                            width: 320.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => CreatLogin())
                                );
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                              ),
                              child: Text("Let's Start   👉",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

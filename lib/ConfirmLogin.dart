import 'package:flutter/material.dart';
import 'package:todo/Addnote.dart';

class ConfirmLogin extends StatefulWidget {
  const ConfirmLogin({Key? key}) : super(key: key);

  @override
  State<ConfirmLogin> createState() => _ConfirmLoginState();
}

class _ConfirmLoginState extends State<ConfirmLogin> {

  TextEditingController _confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/Todo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_sharp,),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("When ",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.deepPurpleAccent.shade100
                              ),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Community ",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.deepPurpleAccent.shade100
                              ),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Comes Unity ",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.deepPurpleAccent.shade100
                              ),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 200.0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(0, 2),
                              blurRadius: 5,
                              spreadRadius: 0,
                            ),
                          ],
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          controller: _confirmpassword,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                            icon: Icon(Icons.lock,color: Colors.deepPurpleAccent.shade100),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        height: 50.0,
                        width: 320.0,
                        child: ElevatedButton(
                          onPressed: () {

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Addnote())
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
                          child: Text("Procced",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

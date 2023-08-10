import 'package:flutter/material.dart';
import 'package:todo/ConfirmLogin.dart';

class CreatLogin extends StatefulWidget {
  const CreatLogin({Key? key}) : super(key: key);

  @override
  State<CreatLogin> createState() => _CreatLoginState();
}

class _CreatLoginState extends State<CreatLogin> {

  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();


  bool _isChecked = false;

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
                      SizedBox(height: 20.0),
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
                          controller: _fullname,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                            icon: Icon(Icons.person,color: Colors.deepPurpleAccent.shade100),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
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
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                            icon: Icon(Icons.person,color: Colors.deepPurpleAccent.shade100),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
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
                          controller: _password,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                            icon: Icon(Icons.lock_clock_outlined,color: Colors.deepPurpleAccent.shade100),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
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
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            activeColor: Colors.deepPurpleAccent,
                            checkColor: Colors.white,
                          ),
                          Text("Remember Me"),
                          SizedBox(width: 100.0),
                          Text("Forgot Password"),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 50.0,
                        width: 320.0,
                        child: ElevatedButton(
                          onPressed: () {
                            var name = _fullname.text.toString();
                            var email = _email.text.toString();
                            var password = _password.text.toString();
                            var confirmpassword = _confirmpassword.text.toString();

                            if(name.length<=0)
                            {
                              var snackbar = SnackBar(
                                content: Text("Enter Valid Name  ",style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold
                                ),),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 4),
                                padding: EdgeInsets.all(10.0),
                                action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            }
                            else if(email.length<=0)
                            {
                              var snackbar = SnackBar(
                                content: Text("Enter Email "),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 4),
                                elevation: 5.0,
                                action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            }
                            else if(password.length<=0)
                            {
                              var snackbar = SnackBar(
                                content: Text("Enter  password "),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 4),
                                elevation: 5.0,
                                action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            }
                            else if(confirmpassword.length<=0)
                            {
                              var snackbar = SnackBar(
                                content: Text("Enter Confirm password "),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 4),
                                elevation: 5.0,
                                action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            }


                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ConfirmLogin())
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

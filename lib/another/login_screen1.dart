import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:flutter/material.dart';

import '../home_page.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController memberIdController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var isvisible = true;
  var _isvisible = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // final String postsUrl ="https://bppshops.com/api/sendOtp";
  // Future<int> getPost() async {
  //   var res = await http.post(Uri.parse(postsUrl),
  //       body: {'mobile': numberController.text});
  //   return res.statusCode;
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to DTBA",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    label: Text("Please Enter Your Name"),
                    //hintText: "En",
                    fillColor: Colors.white70),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Name';
                  } else if (value.length <= 2) {
                    return 'minimam 3 character';
                  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Invilid EXpression';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: userController,
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    label: Text("Please Enter Your Email"),
                    //hintText: "En",
                    fillColor: Colors.white70),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Email';
                  } else if (!RegExp(r'^[\w\.]+@').hasMatch(value)) {
                    return ' Invalid Email1';
                  } else if (!RegExp(r'^[\w\.]+@([\g])').hasMatch(value)) {
                    return '"Invalid Email"';
                  } else if (!RegExp(r'^[\w\.]+@([\w]+\.)').hasMatch(value)) {
                    return '"."  Is Not In Proper Place';
                  } else if (!RegExp(r'^[\w\.]+@([\w]+\.)+[\w]{2,4}')
                      .hasMatch(value)) {
                    return 'Atlest character 2 after " . "';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: emailController,
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    label: Text("Please enter Phone Number"),
                    //hintText: "En",
                    fillColor: Colors.white70),
                controller: mobileController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Phone Number';
                  } else if (!RegExp(
                          r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                      .hasMatch(value)) {
                    return ' Invalid Mobile Number';
                  } else if (value.length <= 10) {
                    return 'Must Enter 11 Dgits';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    label: Text("Enter Your Password"),
                    //hintText: "En",
                    fillColor: Colors.white70),
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password';
                  }

                  //UpperCase,lowerCase,numerical Symbol,Number
                  else if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return ' Must be upper & lower case & symbol & number';
                  } else if (value.length <= 7) {
                    return 'Must Enter 8 Dgits';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Color(0xffE37D4E),
                  elevation: 3,
                  //  minimumSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Home_page()));
                  }
                  // if (numberController.text.isNotEmpty) {
                  //   int responseStatus =await getPost();
                  //   print(responseStatus);
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) =>
                  //           SendOtpScreen(mobile: numberController.text.toString(), token: '',)
                  //   )
                  //   );
                  //   // if (responseStatus == 200) {
                  //   //   Navigator.of(context).push(MaterialPageRoute(
                  //   //       builder: (context) =>
                  //   //           SendOtp_screen(mobile: numberController.text.toString(), token: '',)
                  //   //   )
                  //   //   );
                  //   // }
                  // }
                },
                child: Container(
                  //margin: EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

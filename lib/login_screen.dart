import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController memberIdController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final String postsUrl = "https://bppshops.com/api/sendOtp";
  // Future<int> getPost() async {
  //   var res = await http.post(Uri.parse(postsUrl),
  //       body: {'mobile': numberController.text});
  //   return res.statusCode;
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      label: Text("Member ID"),
                      //hintText: "En",
                      fillColor: Colors.white70),
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'ˆ[0-9]+$').hasMatch(value!) ||
                        value.length < 5) {
                      return "Enter Correct MemberId";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: memberIdController,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      //hintText: "Enter your phone number",
                      label: Text("Phone Number"),
                      fillColor: Colors.white70),
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'ˆ[0-9]+$').hasMatch(value!) ||
                        value.length < 11) {
                      return "Enter correct number";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: numberController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                    // if(formkey.currentState!.validate()){
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SendOtpScreen(mobile: numberController.text.toString(), token: "")));
                    //
                    // }
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
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

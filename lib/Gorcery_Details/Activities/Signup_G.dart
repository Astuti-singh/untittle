import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Login_G.dart';

class Signup_Grocery extends StatelessWidget
{const Signup_Grocery({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Signup_page(),
    );
  }}

class Signup_page extends StatelessWidget{
  const Signup_page({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.redAccent,
                Colors.orange,
                Colors.orangeAccent,
              ],
            ),

          ),

          child: Column
            (
            mainAxisSize: MainAxisSize.max,
            children:[
              Expanded(
                child: Image.asset('assets/image/signup.png',
                  color: Colors.white,
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child:  Padding(
                  padding: EdgeInsets.only(bottom: 30,right: 30),
                  child: Text(
                    'Register',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

              )
            ],
          ),


        ),
        Signup_information(),

      ],
    );
  }
}
class Signup_information extends StatefulWidget{
  const Signup_information({super.key});
  @override
  State<StatefulWidget> createState() => Put_Signup_data();
}
class Put_Signup_data extends State<StatefulWidget>{
  bool   _passwordVisible = false;
  TextEditingController user_name=TextEditingController();
  TextEditingController user_password=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController confirm_password=TextEditingController();
  TextEditingController phoneno=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50,left: 30,right: 30),
      child: Column
        (
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration
              (
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3)// changes position of shadow
                ),
              ],
            ),
            child: TextFormField(
              controller: user_name,
              keyboardType: TextInputType.text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person),
                labelText: 'Full Name',
              ),


            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration
              (
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3)// changes position of shadow
                ),
              ],
            ),
            child: TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email),
                labelText: 'Email ID',
              ),


            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration
              (
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3)// changes position of shadow
                ),
              ],
            ),
            child: TextFormField(
              controller: phoneno,
              keyboardType: TextInputType.phone,
              inputFormatters:[LengthLimitingTextInputFormatter(10)],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.call),
                labelText: 'Phone Number',
              ),


            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration
              (
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3)// changes position of shadow
                ),
              ],
            ),
            child: TextFormField(
              controller: user_password,
              obscureText: true,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.key),
                labelText: 'Password',

                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration
              (
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3)// changes position of shadow
                ),
              ],
            ),
            child: TextFormField(
              controller: confirm_password,
              obscureText: true,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.key),
                labelText: 'Confirm Password',

                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login_G()),
              );


            },
            child:  Container(
              margin: EdgeInsets.only(top: 70),
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.redAccent,
                    Colors.orange,
                    Colors.orangeAccent,
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3)// changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text('REGISTER',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('Already a member?'),
                GestureDetector(
                  child: const Text('  Login',
                    style: TextStyle(fontSize:13,
                        fontWeight: FontWeight.w400,
                        color: Colors.deepOrange),
                  ),
                  onTap: () {
                    //signup screen
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login_G()),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
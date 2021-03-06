import 'package:firebase_app/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    List images = ['g.png', 't.png', 'f.png'];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/signup.png"), fit: BoxFit.cover),
            ),
            child: Column(children: [
              SizedBox(
                height: h * 0.16,
              ),
              CircleAvatar(
                backgroundColor: Colors.white70,
                radius: 45,
                backgroundImage: AssetImage("img/profile1.png"),
              )
            ]),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2))
              ],
            ),
            child: TextField(
              controller: emailController,
              style: TextStyle(fontSize: 18.0, height: 0.3),
              decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepOrangeAccent,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2))
              ],
            ),
            child: TextField(
              controller: passwordController,
              style: TextStyle(fontSize: 18.0, height: 0.3),
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.password_outlined,
                    color: Colors.deepOrangeAccent,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              AuthController.instance.register(
                  emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w * 0.3,
              height: h * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("img/loginbtn.png"), fit: BoxFit.cover),
              ),
              child: Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => LoginPage()),
                  text: "Have an account",
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]))),
          SizedBox(height: w * 0.2),
          RichText(
              text: TextSpan(
            text: "Sign up using one of the following methods",
            style: TextStyle(color: Colors.grey[500], fontSize: 16),
          )),
          SizedBox(height: 10),
          Wrap(
            children: List<Widget>.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[500],
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('img/' + images[index]),
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}

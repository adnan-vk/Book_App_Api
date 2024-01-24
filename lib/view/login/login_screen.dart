// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project/controller/user_provider.dart';
import 'package:project/view/details/details.dart';
import 'package:project/widgets/bottom_bar.dart';
import 'package:project/view/signup/signup.dart';
import 'package:project/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .2,
              ),
              Material(
                elevation: 5,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 106, left: 20, right: 20),
                  width: double.infinity,
                  height: size.height * .6,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: text(data: "WELCOME BACK")),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: text(
                              data: "Log In",
                              color: appcolor.orange,
                              weight: FontWeight.bold,
                              size: 30)),
                      const SizedBox(
                        height: 15,
                      ),
                      textformfield(
                          controller: pro.usernamecontroller,
                          labeltext: "Enter Your Username"),
                      const SizedBox(
                        height: 20,
                      ),
                      textformfield(
                          controller: pro.passwordcontroller,
                          labeltext: "Enter Your Password"),
                      const SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton.extended(
                        label: text(data: "LOGIN"),
                        backgroundColor: appcolor.orange,
                        onPressed: () {
                          userLogin(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          text(data: "Don't Have an Account ? "),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SigninScreen(),
                                  ),
                                );
                              },
                              child:
                                  text(data: "SIGNUP", color: appcolor.orange)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  userLogin(context) async {
    bool isLoginSuccessful = true;

    if (isLoginSuccessful) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('savekey', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomBar()),
      );
    }
  }
}

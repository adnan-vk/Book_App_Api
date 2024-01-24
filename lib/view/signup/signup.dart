import 'package:flutter/material.dart';
import 'package:project/controller/user_provider.dart';
import 'package:project/model/user_model.dart';
import 'package:project/view/details/details.dart';
import 'package:project/view/login/login_screen.dart';
import 'package:project/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final TextEditingController usernamcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  padding: const EdgeInsets.only(top: 55, left: 20, right: 20),
                  width: double.infinity,
                  height: size.height * .6,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: text(data: "WELCOME")),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: text(
                              data: "Sign up",
                              color: appcolor.orange,
                              weight: FontWeight.bold,
                              size: 30)),
                      const SizedBox(
                        height: 15,
                      ),
                      textformfield(
                          controller: usernamcontroller,
                          labeltext: "Enter Your Username"),
                      const SizedBox(
                        height: 20,
                      ),
                      textformfield(
                          controller: passwordcontroller,
                          labeltext: "Enter Your Password"),
                      const SizedBox(
                        height: 20,
                      ),
                      textformfield(
                          controller: emailController,
                          labeltext: "Enter Your Email"),
                      const SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton.extended(
                          label: const Text("SIGNUP"),
                          backgroundColor: Colors.orange,
                          onPressed: () {
                            createUser(context);
                          }),
                      Row(
                        children: [
                          text(data: "Back to Login.."),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child:
                                  text(data: "LOGIN", color: appcolor.orange)),
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

  createUser(context) async {
    final userInfo = UserModel(
      username: usernamcontroller.text.toString(),
      password: passwordcontroller.text.toString(),
      email: emailController.text.toString(),
    );

    Provider.of<UserProvider>(context, listen: false).createUser(userInfo);
    Navigator.pop(context);
  }
}

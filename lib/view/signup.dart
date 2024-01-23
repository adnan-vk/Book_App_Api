import 'package:flutter/material.dart';
import 'package:project/controller/userprovider.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/view/loginscreen.dart';
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
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("WELCOME")),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: usernamcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Enter Your Username",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Enter Your Password",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Enter Your Email",
                        ),
                      ),
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
                          const Text("Back to Login.."),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ));
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.orange),
                              )),
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

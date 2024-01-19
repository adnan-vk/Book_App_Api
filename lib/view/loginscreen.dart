

import 'package:flutter/material.dart';
import 'package:project/controller/userprovider.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/view/homepage.dart';
import 'package:project/view/signup.dart';
import 'package:provider/provider.dart';

String tokenId = '';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        // padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
              width: double.infinity,
              height: size.height * .6,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Color.fromARGB(255, 142, 124, 124)),
              child: Column(
                children: [
                  TextFormField(
                    controller: pro.usernamcontroller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        labelText: "Enter Your Username",
                        labelStyle: const TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: pro.passwordcontroller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        labelText: "Enter Your Password",
                        labelStyle: const TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 63, 69, 40))),
                      onPressed: () {
                        userLogin(context);
                      },
                      child: const Text("LOGIN",
                          style: TextStyle(color: Colors.white))),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninScreen(),
                            ));
                      },
                      child: const Text(
                        "Go to SignIn",
                        style: TextStyle(
                            color: Color.fromARGB(
                              255,
                              8,
                              7,
                              60,
                            ),
                            fontWeight: FontWeight.w800),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  userLogin(context) async {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    final userInfo = UserModel(
      username: getProvider.usernamcontroller.text.toString(),
      password: getProvider.passwordcontroller.text.toString(),
    );

    // try {
      await getProvider.userLogin(userInfo);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      // log("Token : $tokenId");
      // if (getProvider.userStatusCode == "200" && tokenId.isNotEmpty) {
      //   final sharedPreferences = await SharedPreferences.getInstance();
      //   await sharedPreferences.setString('token', tokenId);
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => const HomePage()));
      // } else if (getProvider.userStatusCode == '500') {}
    // } catch (e) {
    //   log('Error during user login: $e');
    // }
  }
}

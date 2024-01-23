// import 'package:flutter/material.dart';
// import 'package:project/controller/userprovider.dart';
// import 'package:project/model/usermodel.dart';
// import 'package:project/view/bottombar.dart';
// import 'package:project/view/homepage.dart';
// import 'package:project/view/signup.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // String tokenId = '';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final pro = Provider.of<UserProvider>(context);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           // alignment: Alignment.center,
//           padding: const EdgeInsets.all(40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: size.height * .2,
//               ),
//               Material(
//                 elevation: 5,
//                 child: Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.only(top: 106, left: 20, right: 20),
//                   width: double.infinity,
//                   height: size.height * .6,
//                   child: Column(
//                     children: [
//                       const Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text("WELCOME BACK")),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Log In",
//                             style: TextStyle(
//                                 color: Colors.orange,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 30),
//                           )),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       TextFormField(
//                         controller: pro.usernamecontroller,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           labelText: "Enter Your Username",
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         controller: pro.passwordcontroller,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           labelText: "Enter Your Password",
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       FloatingActionButton.extended(
//                         label: const Text("LOGIN"),
//                         backgroundColor: Colors.orange,
//                         onPressed: () {
//                           userLogin(context);
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           const Text("Dont Have an Account ? "),
//                           TextButton(
//                               onPressed: () {
//                                 userLogin(context);
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => SigninScreen(),
//                                     ));
//                               },
//                               child: const Text(
//                                 "SIGNUP",
//                                 style: TextStyle(color: Colors.orange),
//                               )),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // userLogin(context) async {
//   //   final getProvider = Provider.of<UserProvider>(context, listen: false);
//   //   final userInfo = UserModel(
//   //     username: getProvider.usernamcontroller.text.toString().trim(),
//   //     password: getProvider.passwordcontroller.text.toString().trim(),
//   //   );
//   //   await getProvider.userLogin(userInfo);
//   //   Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => const BottomBar(),
//   //       ));
//   // }
// }

import 'package:flutter/material.dart';
import 'package:project/controller/userprovider.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/view/bottombar.dart';
import 'package:project/view/signup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

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
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("WELCOME BACK"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: pro.usernamecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Enter Your Username",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: pro.passwordcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Enter Your Password",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton.extended(
                        label: const Text("LOGIN"),
                        backgroundColor: Colors.orange,
                        onPressed: () {
                          userLogin(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text("Don't Have an Account ? "),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  SigninScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "SIGNUP",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
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
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    final userInfo = UserModel(
      username: getProvider.usernamecontroller.text.trim(),
      password: getProvider.passwordcontroller.text.trim(),
    );
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

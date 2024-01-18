import 'package:flutter/material.dart';
import 'package:project/controller/userprovider.dart';
import 'package:project/model/usermodel.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  TextEditingController usernamcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: usernamcontroller,
              decoration: InputDecoration(labelText: "Enter Your Username"),
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(labelText: "Enter Your Password"),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Enter Your Email"),
            ),
            ElevatedButton(
                onPressed: () {
                  createUser(context);
                  Navigator.pop(context);
                },
                child: Text("SIGNIN"))
          ],
        ),
      ),
    );
  }

  createUser(context) async {
  final userInfo = UserModel(
    usernamcontroller.text.toString(),
    passwordcontroller.text.toString(),
    emailController.text.toString(),
  );

  Provider.of<UserProvider>(context, listen: false).createUser(userInfo);
}

}

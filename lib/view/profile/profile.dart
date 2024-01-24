// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/view/details/details.dart';
import 'package:project/view/login/login_screen.dart';
import 'package:project/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("PROFILE"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.orange),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                    radius: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      text(
                          data: "ADNAN",
                          color: appcolor.orange,
                          weight: FontWeight.w900),
                      text(
                          data: "adnan@gmail.com",
                          color: appcolor.orange,
                          weight: FontWeight.w300),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                        data: "ABOUT",
                        color: appcolor.orange,
                        weight: FontWeight.bold),
                    const Icon(
                      Icons.info,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                        data: "PRIVACY AND POLICY",
                        color: appcolor.orange,
                        weight: FontWeight.bold),
                    const Icon(
                      Icons.privacy_tip_outlined,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                        data: "SETTINGS",
                        color: appcolor.orange,
                        weight: FontWeight.bold),
                    const Icon(
                      Icons.settings,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final data = await SharedPreferences.getInstance();
                data.clear();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text(
                          data: "LOGOUT",
                          color: appcolor.orange,
                          weight: FontWeight.bold),
                      const Icon(
                        Icons.logout_outlined,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

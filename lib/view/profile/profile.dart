// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/view/login/login_screen.dart';
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
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "ADNAN",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "adnan@gmail.com",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ABOUT",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.info,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            const Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PRIVACY AND POLICY",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.privacy_tip_outlined,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            const Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SETTINGS",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    Icon(
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
              child: const Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LOGOUT",
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      Icon(
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

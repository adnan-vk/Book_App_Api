import 'package:flutter/material.dart';
import 'package:project/view/details/details.dart';
import 'package:project/widgets/bottom_bar.dart';
import 'package:project/view/login/login_screen.dart';
import 'package:project/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: size.height * 0.4,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color.fromARGB(255, 253, 177, 63),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.1),
                          text(
                              data: 'Discover a World of',
                              color: appcolor.white,
                              size: 28,
                              weight: FontWeight.bold),
                          text(
                              data: 'Books',
                              color: appcolor.white,
                              size: 28,
                              weight: FontWeight.bold),
                          const SizedBox(height: 20),
                          text(
                              data:
                                  'Explore, Read, and Immerse Yourself in Endless Stories',
                              color: appcolor.white,
                              size: 16,
                              align: TextAlign.center),
                          const SizedBox(height: 35),
                          SizedBox(
                            height: size.height * .05,
                            width: size.width * .5,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () {
                                checkUserLoggedIn(context);
                              },
                              child: text(
                                data: 'Get Started',
                                color: appcolor.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  checkUserLoggedIn(context) async {
    final sharedPrfs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrfs.getBool('savekey');
    if (userLoggedIn == null || userLoggedIn == false) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const BottomBar(),
      ));
    }
  }
}
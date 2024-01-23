
import 'package:flutter/material.dart';
import 'package:project/controller/bookprovider.dart';
import 'package:project/view/bottombar.dart';
import 'package:project/view/loginscreen.dart';
import 'package:provider/provider.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/book 01.png'))
        ),
        child: Stack(
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
                            SizedBox(
                                height: size.height *
                                    0.1),
                            const Text(
                              'Discover a World of Books',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20), 
                            const Text(
                              'Explore, Read, and Immerse Yourself in Endless Stories',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                             SizedBox(height: 35),
                            SizedBox(
                              height: size.height*.05,
                              width: size.width*.5,
                              child: ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: const Text('Get Started',style: TextStyle(color: Colors.orange), ),
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
      ),
    );
  }
}

checkLogin(context) async {
  // final getProvider = Provider.of<UserProvider>(context, listen: false);
  final userLoggedIn = await Provider.of<BookProvider>(context, listen: false)
      .getValues('tokenId');
  if (userLoggedIn == null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  } else {
    // await getProvider.setUserData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomBar(),
      ),
    );
  }
}

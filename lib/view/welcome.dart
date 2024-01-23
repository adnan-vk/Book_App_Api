import 'package:flutter/material.dart';
import 'package:project/view/bottombar.dart';
import 'package:project/view/homepage.dart';
import 'package:project/view/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   // color: Colors.red,
        //   // image: DecorationImage(image: AssetImage('assets/images/bg 01.jpg'),fit: BoxFit.fill)
        // ),
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
                            SizedBox(height: size.height * 0.1),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(color: Colors.orange),
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
      ),
    );
  }
  // checkuserlogin(){
  //   final shrd = SharedPreferences.getInstance();
  //   final pref = shrd.getBool(key);
  // }
  checkUserLoggedIn(context)async{
    final _sharedPrfs =await SharedPreferences.getInstance();
    final _userLoggedIn=_sharedPrfs.getBool('savekey');
    if(_userLoggedIn==null || _userLoggedIn == false){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomBar(),));
    }
  }
}

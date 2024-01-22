import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project/view/loginscreen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
         padding: const EdgeInsets.all(15),
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  // opacity: .7,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/weather bg (2).jpg'))
        ),
        child: Column(children: [
          ElevatedButton(onPressed: (){log('userLoggedIn');
            // checkLogin(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
          }, child: const Text('click')),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              image: DecorationImage(image: AssetImage('assets/images/book 01.png'))
            ),
          )
        ],
        ),
      ),
    );
  }

  // checkLogin(context) async {
  //   final userLoggedIn =
  //       await Provider.of<ShrdProvider>(context, listen: false).getToken().toString();
  //       log(userLoggedIn);
  //   if (userLoggedIn.isEmpty) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => LoginScreen(),
  //       ),
  //     );
  //   } else {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomePage(),
  //       ),
  //     );
  //   }
  // }
}
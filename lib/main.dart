import 'package:flutter/material.dart';
import 'package:project/controller/bookprovider.dart';
import 'package:project/controller/userprovider.dart';
import 'package:project/view/loginscreen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BookProvider(),
        ),
        ChangeNotifierProvider(create: (context) => UserProvider(),)
      ],
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}

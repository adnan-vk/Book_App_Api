import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/controller/bookprovider.dart';
import 'package:project/controller/shrdprfprovider.dart';
import 'package:project/controller/userprovider.dart';
import 'package:project/view/homepage.dart';
import 'package:project/view/loginscreen.dart';
import 'package:project/view/welcome.dart';
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
        ChangeNotifierProvider(create: (context) => UserProvider(),),
        ChangeNotifierProvider(create: (context) => ShrdProvider(),),
      ],
      child:   MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: GoogleFonts.raleway(),
            bodyMedium: GoogleFonts.raleway(),
            bodySmall: GoogleFonts.raleway(),
            displayLarge: GoogleFonts.raleway(),
            displayMedium: GoogleFonts.raleway(),
          )
        ),
        debugShowCheckedModeBanner: false,
        home: const Welcome(),
      ),
    );
  }
}
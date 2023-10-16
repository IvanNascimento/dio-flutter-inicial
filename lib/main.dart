import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:inicial/view/login.dart';

void main() {
  runApp(const EclipseIMC());
}

class EclipseIMC extends StatelessWidget {
  const EclipseIMC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
          textTheme: GoogleFonts.robotoTextTheme(),
          useMaterial3: true,
        ),
        home: const LoginView());
  }
}

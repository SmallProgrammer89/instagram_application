import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';
import 'package:instagram_flutter/screens/splash_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _getThemeData(context),
      home: SplashScreen(),
    );
  }

  ThemeData _getThemeData(BuildContext context) {
    return ThemeData(
      //this text style can use in the whole application when we need:
      textTheme: TextTheme(
        headline4: TextStyle(
          color: whiteColor,
          fontFamily: 'GB',
          fontSize: 16.0,
        ),
      ),

      //this button style can apply to the elevatedbuttons which we'll use in different pages:
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: mediumPinkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          textStyle: TextStyle(
            color: whiteColor,
            fontFamily: 'GB',
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

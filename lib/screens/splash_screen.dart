import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';
import 'package:instagram_flutter/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadLoginScreen();
  }

  _loadLoginScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          opacity: 0.1,
          image: AssetImage('images/pattern1.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Center(
            child: Image(
              image: AssetImage('images/logo_splash.png'),
            ),
          ),
        ),
        Positioned(
          bottom: 32.0,
          child: Column(
            children: [
              Text(
                'from',
                style: TextStyle(
                    fontSize: 16.0,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Facebook',
                style: TextStyle(
                    fontSize: 16.0,
                    color: lightGreyColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}

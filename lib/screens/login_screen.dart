import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';
import 'package:instagram_flutter/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        //_emailFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        //_passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            purpleGradientColor,
            pinkGradientColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          child: Image(
            height: MediaQuery.of(context).size.height * .50,
            image: AssetImage('images/rocket.png'),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * .50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: backgroundColor,
            ),
            child: _getContentContainer(context),
          ),
        )
      ],
    );
  }

  Widget _getContentContainer(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Sign in to ',
              style: Theme.of(context).textTheme.headline4,
            ),
            Image(
              image: AssetImage('images/mood.png'),
            ),
          ],
        ),
        SizedBox(
          height: 34,
        ),
        _getTextField('Email', 'example@gmail.com', _emailFocusNode, false),
        SizedBox(
          height: 32,
        ),
        _getTextField('Password', '************', _passwordFocusNode, true),
        SizedBox(
          height: 32,
        ),
        ElevatedButton(
          child: Text('Sign in'),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => MainScreen()),
            ),
          ),
          style: Theme.of(context).elevatedButtonTheme.style,
        ),
        SizedBox(
          height: 38,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: TextStyle(
                  color: lightGreyColor, fontFamily: 'GB', fontSize: 16.0),
            ),
            Text(
              '/ Sign up',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        )
      ],
    );
  }

  Widget _getTextField(
      String str1, String str2, FocusNode focusNode, bool obsecureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: TextField(
        style: TextStyle(color: lightGreyColor),
        focusNode: focusNode,
        obscureText: obsecureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 3, color: lightGreyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 3,
              color: mediumPinkColor,
            ),
          ),
          labelText: str1,
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mediumPinkColor : lightGreyColor,
              fontFamily: 'GM',
              fontSize: 18),
          hintText: str2,
          hintStyle: TextStyle(color: lightGreyColor),
        ),
      ),
    );
  }
}

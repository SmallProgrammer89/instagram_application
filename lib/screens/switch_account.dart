import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';

class SwitchAccountScreen extends StatefulWidget {
  SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  State<SwitchAccountScreen> createState() => _SwitchAccountScreenState();
}

class _SwitchAccountScreenState extends State<SwitchAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(backgroundColor, BlendMode.color),
          opacity: 0.1,
          repeat: ImageRepeat.repeat,
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
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/switch_account_background.png'),
                  ),
                ),
              ),
              _getBluredContainer()
            ],
          ),
        ),
        //bottom text:
        Padding(
          padding: EdgeInsets.only(bottom: 63, top: 132),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? /',
                style: TextStyle(
                    color: lightGreyColor, fontFamily: 'GB', fontSize: 16.0),
              ),
              Text(
                ' Sign up',
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        )
      ],
    );
  }

  //the container which is blured:
  Widget _getBluredContainer() {
    return Positioned(
      top: 210,
      left: 30,
      right: 30,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            width: 340,
            height: 352,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.5),
                    Color.fromRGBO(255, 255, 255, 0.2)
                  ]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/img_profile.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'nima zarei',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 129,
                  height: 46,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {},
                    child: Text('Confrim'),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'switch account',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

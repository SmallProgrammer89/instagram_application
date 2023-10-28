import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';
import 'package:instagram_flutter/screens/activity_screen.dart';
import 'package:instagram_flutter/screens/add_post_screen.dart';
import 'package:instagram_flutter/screens/home_screen.dart';
import 'package:instagram_flutter/screens/profile_screen.dart';
import 'package:instagram_flutter/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationBarItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          backgroundColor: backgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedBottomNavigationBarItem,
          onTap: (int index) {
            setState(() {
              _selectedBottomNavigationBarItem = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_home.png'),
              activeIcon: Image.asset('images/icon_active_home.png'),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_search_navigation.png'),
              activeIcon:
                  Image.asset('images/icon_search_navigation_active.png'),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_add_navigation.png'),
              activeIcon: Image.asset('images/icon_add_navigation_active.png'),
              label: 'add',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_activity_navigation.png'),
              activeIcon:
                  Image.asset('images/icon_activity_navigation_active.png'),
              label: 'likes',
            ),
            BottomNavigationBarItem(
              icon: _getProfileIconConatiner(lightGreyColor),
              activeIcon: _getProfileIconConatiner(mediumPinkColor),
              label: 'profile',
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationBarItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddPostScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }

  Widget _getProfileIconConatiner(Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: FittedBox(
          child: Image.asset(
            'images/img_profile.png',
          ),
        ),
      ),
    );
  }
}
  //label styles
        /*selectedIconTheme: IconThemeData(color: mediumPinkColor),
        selectedItemColor: mediumPinkColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        unselectedItemColor: lightGreyColor,*/
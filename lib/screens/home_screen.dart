import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';
import 'dart:ui';

import 'package:instagram_flutter/widgets/share_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> userList = [
    '',
    'img_profile',
    'user0',
    'user1',
    'user2',
    'user3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Image.asset(
          'images/moodinger_logo.png',
          height: 24,
          width: 125,
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 12),
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            _getPostList(),
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return index == 0
              ? _getYourStoryBox(context)
              : _getStoryBox(context, index);
        }),
      ),
    );
  }

  Widget _getPostList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 16,
              ),
              _getPostHeader(context),
              SizedBox(
                height: 16,
              ),
              _getPostContent(context, index),
            ],
          );
        },
        childCount: 4,
      ),
    );
  }

  Widget _getPostContent(BuildContext context, int index) {
    return Container(
      width: 394,
      height: 394,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            left: 8,
            right: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'images/post$index.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: Image.asset(
              'images/icon_video.png',
            ),
          ),
          Positioned(
            bottom: 12,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                child: Container(
                  height: 46,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text('2.5 k',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 14))
                        ],
                      ),
                      SizedBox(width: 42),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(width: 6),
                          Text('1.5 k',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 14))
                        ],
                      ),
                      SizedBox(width: 42),
                      GestureDetector(
                        onTap: () => showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: ((context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  //use this to solve softkeyboard bug
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: DraggableScrollableSheet(
                                initialChildSize: 0.4,
                                minChildSize: 0.1,
                                maxChildSize: 0.8,
                                builder: ((context, scrollController) =>
                                    ShareBottomsheet(
                                      scrollController: scrollController,
                                    )),
                              ),
                            );
                          }),
                        ),
                        child: Image.asset('images/icon_share.png'),
                      ),
                      SizedBox(width: 42),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getPostHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          _getProfileBox(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'nima zarei',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 12),
                ),
                Text(
                  'برنامه نویس موبایل',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getProfileBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: mediumPinkColor,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      strokeWidth: 2,
      dashPattern: [20, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('images/img_profile.png'),
        ),
      ),
    );
  }

  Widget _getStoryBox(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: mediumPinkColor,
            strokeWidth: 2,
            dashPattern: [30, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/${userList[index]}.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            userList[index],
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _getYourStoryBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: whiteColor,
            strokeWidth: 2,
            dashPattern: [40, 0],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Your Story',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

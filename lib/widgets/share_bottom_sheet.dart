import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';

class ShareBottomsheet extends StatelessWidget {
  const ShareBottomsheet({this.scrollController, Key? key}) : super(key: key);
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
        child: Container(
          height: 450,
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.10),
          ),
          child: _getMainContent(context),
        ),
      ),
    );
  }

  Widget _getMainContent(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: _getTopContent(context),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getProfileContainer(context, index);
                },
                childCount: 20,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 20.0,
                mainAxisExtent: 100.0,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 80.0),
            )
          ],
        ),
        Positioned(
          bottom: 22,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 13.0),
              child: Text('Send', style: Theme.of(context).textTheme.headline4),
            ),
          ),
        )
      ],
    );
  }

  Widget _getProfileContainer(BuildContext context, int index) {
    final List<String> userList = [
      'img_profile',
      'user0',
      'user1',
      'user2',
      'user3',
      'img_profile',
      'user0',
      'user1',
      'user2',
      'user3',
      'img_profile',
      'user0',
      'user1',
      'user2',
      'user3',
      'img_profile',
      'user0',
      'user1',
      'user2',
      'user3',
    ];
    return Column(
      children: [
        Container(
          height: 60.0,
          width: 60.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset('images/${userList[index]}.png'),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          userList[index],
          style:
              Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12.0),
        )
      ],
    );
  }

  Widget _getTopContent(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5,
          width: 67,
          margin: EdgeInsets.only(
            top: 10,
            bottom: 22,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: whiteColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Share',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 20.0),
            ),
            Image.asset('images/icon_share_bottomsheet.png'),
          ],
        ),
        SizedBox(
          height: 32,
        ),
        Container(
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Image.asset('images/icon_search.png'),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Search User ...',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

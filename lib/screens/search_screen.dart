import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchBox(),
            ),
            SliverToBoxAdapter(
              child: _getCategoryList(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: _getListItems(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getListItems() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/post$index.png'),
            ),
          );
        },
        childCount: 12,
      ),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          QuiltedGridTile(2, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
    );
  }

  Widget _getCategoryList() {
    final List<String> categoryItems = [
      'Accounts',
      'Cloths',
      'Fashion',
      'Movie',
      'Music',
      'English',
      'News',
      'Technology',
    ];
    return Container(
      height: 31,
      margin: EdgeInsets.symmetric(vertical: 14.0),
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: darkBlueColor,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  categoryItems[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 12.0,
                    fontFamily: 'GM',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _getSearchBox() {
    return Container(
      height: 46,
      margin: EdgeInsets.only(left: 17.0, right: 17.0, top: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: darkBlueColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Image.asset('images/icon_search.png'),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search User ...',
                  hintStyle: TextStyle(color: whiteColor),
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Image.asset('images/icon_scan.png'),
          ],
        ),
      ),
    );
  }
}

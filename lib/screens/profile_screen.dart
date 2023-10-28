import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: 64,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 18, top: 18),
                      child: Icon(Icons.menu),
                    ),
                  ],
                  backgroundColor: backgroundColor,
                  expandedHeight: 168,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/profile_background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: backgroundColor,
                      ),
                    ),
                  ),
                  automaticallyImplyLeading: false,
                ),
                SliverToBoxAdapter(
                  child: _getUserProfileRow(context),
                ),
                SliverToBoxAdapter(
                  child: _getButtonRow(),
                ),
                SliverToBoxAdapter(
                  child: _getHighlightList(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: CustomTabBarDelegate(
                    TabBar(
                      indicatorColor: mediumPinkColor,
                      indicatorWeight: 2,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
                      tabs: [
                        Tab(
                          icon: Image.asset('images/icon_tab_posts.png'),
                        ),
                        Tab(
                          icon: Image.asset('images/icon_tab_bookmark.png'),
                        )
                      ],
                    ),
                  ),
                )
              ];
            }),
            body: _getScrollViewBody(),
          ),
        ),
      ),
    );
  }

  Widget _getScrollViewBody() {
    return TabBarView(
      children: [
        CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(left: 6, right: 6, top: 20),
              sliver: SliverGrid(
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
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            )
          ],
        ),
        CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(left: 6, right: 6, top: 20),
              sliver: SliverGrid(
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
                  childCount: 6,
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _getHighlightList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return index == 0
              ? _getPlusBox(context)
              : _getHighlightBox(context, index);
        }),
      ),
    );
  }

  Widget _getHighlightBox(BuildContext context, int index) {
    final List<String> highlighName = [
      '',
      'Projects',
      'Contact us',
      'shopping',
      'Images',
    ];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(2),
            color: whiteColor,
            strokeWidth: 1,
            dashPattern: [40, 0],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/highlight$index.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            highlighName[index],
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _getPlusBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(2),
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
            'Add Highlight',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _getButtonRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: mediumPinkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Follow',
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: lightGreyColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Message',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: lightGreyColor,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getUserProfileRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mediumPinkColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: FittedBox(
                      child: Image.asset(
                        'images/img_profile.png',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 70,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'برنامه نویس موبایل',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 14, fontFamily: 'SM'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Nima zarei',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 12, color: lightGreyColor),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Image.asset('images/icon_profile_edit.png'),
            ],
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            'Mobile App Developer',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 14, color: lightGreyColor),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Flutter | Dart',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 14, color: lightGreyColor),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Image.asset(
                'images/icon_link.png',
                height: 20,
                width: 20,
              ),
             
              
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'followers: 20k',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 14, color: lightGreyColor),
              ),
              Text(
                'following: 20k',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 14, color: lightGreyColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//this class builds a custom header which is persistent
class CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  CustomTabBarDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: _tabBar,
    );
  }

  @override
  // _tabBar.preferredSize.height: this line gets the best => default height for the tabbar widget.
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    //when the maxExtent or minExtent is dynamic it must be return true.
    return false;
  }
}

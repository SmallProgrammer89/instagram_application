import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';
import 'package:instagram_flutter/data/model/enums/activity_status_enum.dart';

class ActivityScreen extends StatefulWidget {
  ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _getTabBarContainer(context),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        _getSliverToAdapterBox('New'),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getActivityRow(ActivityStatus.followBack);
            },
            childCount: 2,
          ),
        ),
        _getSliverToAdapterBox('Today'),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getActivityRow(ActivityStatus.following);
            },
            childCount: 4,
          ),
        ),
        _getSliverToAdapterBox('This week'),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getActivityRow(ActivityStatus.liked);
            },
            childCount: 12,
          ),
        )
      ],
    );
  }

  Widget _getSliverToAdapterBox(String string) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 30, top: 20),
        child: Text(string, style: Theme.of(context).textTheme.headline4),
      ),
    );
  }

  Widget _getActivityRow(ActivityStatus activityStatus) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration:
                BoxDecoration(color: mediumPinkColor, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/img_profile.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 12.0),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    activityStatus == _checkActivityStatus(activityStatus)
                        ? 'and 30 others'
                        : 'Started',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12.0,
                      color: lightGreyColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    activityStatus == _checkActivityStatus(activityStatus)
                        ? 'liked your post'
                        : 'following you',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12.0,
                      color: lightGreyColor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    activityStatus == _checkActivityStatus(activityStatus)
                        ? '2h ago'
                        : '3min',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12.0,
                      color: lightGreyColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          _getYourActivityStatus(activityStatus)
        ],
      ),
    );
  }

  ActivityStatus _checkActivityStatus(ActivityStatus activityStatus) {
    if (activityStatus == ActivityStatus.following &&
        activityStatus == ActivityStatus.followBack) {
      return activityStatus;
    } else {
      return ActivityStatus.liked;
    }
  }

  Widget _getYourActivityStatus(ActivityStatus activityStatus) {
    switch (activityStatus) {
      case ActivityStatus.following:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: lightGreyColor, width: 2),
          ),
          onPressed: () {},
          child: Text(
            'Message',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 12.0,
                  color: lightGreyColor,
                ),
          ),
        );
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: mediumPinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
              color: whiteColor,
              fontFamily: 'GB',
              fontSize: 12.0,
            ),
          ),
          onPressed: () {},
          child: Text(
            'Following',
          ),
        );
      case ActivityStatus.liked:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/post4.png'),
            ),
          ),
        );
      default:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: mediumPinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
              color: whiteColor,
              fontFamily: 'GB',
              fontSize: 12.0,
            ),
          ),
          onPressed: () {},
          child: Text(
            'Following',
          ),
        );
    }
  }

  Widget _getTabBarContainer(BuildContext context) {
    return Container(
      height: 60,
      child: TabBar(
        controller: _tabController,
        labelStyle:
            Theme.of(context).textTheme.headline4!.copyWith(fontSize: 18.0),
        indicatorColor: mediumPinkColor,
        indicatorWeight: 2,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
        tabs: [
          Tab(
            text: 'Following',
          ),
          Tab(
            text: 'You',
          )
        ],
      ),
    );
  }
}

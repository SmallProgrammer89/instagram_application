import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/constants/color_constants.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getCustomScrollSection(context),
            Container(
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: darkBlueColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Draft',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: mediumPinkColor,
                          ),
                    ),
                    Text(
                      'Gallery',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      'Take',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCustomScrollSection(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeaderSection(context),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 394,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/post10.png'),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 18, right: 18, bottom: 82),
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
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
      child: Row(
        children: [
          Text(
            'Post',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 24.0),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 16.0),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset('images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }
}

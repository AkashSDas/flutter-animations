import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double appBarHeight = 64;

  CustomAppBar(this.title);

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  /// This reponsive app bar solution
  /// The outer Container is aligned at the bottomCenter which is the
  /// part from status bar so that the inner Container the part that
  /// is below the status bar is visible. The items for app bar should
  /// be added in the inner Container and styling for the app bar
  /// should be done in outer Container but then this app bar implementation
  /// is very flexible.
  ///
  /// The appBarHeight is the height of the inner Container i.e. the
  /// part below the status bar
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
            ),
          ],
        ),
        child: Container(
          /// Having the height infinite will take the entire space
          /// i.e. also cover the outer Container which has the status
          /// bar part and what will do is that alignement now will
          /// be according to the status bar part + container of height
          /// appBarHeight which not good because the app bar we want to use
          /// is the part below the status bar that's why instead of using
          /// height as double.infinity I've used appBarHeight
          // height: double.infinity,
          height: appBarHeight,
          // width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBackIconBtn(context),
              _buildAppBarTitle(context),
              _buildPlaceholderBtn(context)
            ],
          ),
        ),
      );

  Widget _buildBackIconBtn(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        onPressed: () => Navigator.pop(context),
      );

  Widget _buildAppBarTitle(BuildContext context) => Container(
        alignment: Alignment.center,
        // color: Colors.yellow,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      );

  Widget _buildPlaceholderBtn(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.transparent,
        onPressed: () {},
      );
}

import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:flutter/material.dart';

class UserDefaultLayout extends StatefulWidget {
  final Widget child;
  final Widget appBarTitle;

  const UserDefaultLayout({
    Key? key,
    required this.child,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  _UserDefaultLayoutState createState() => _UserDefaultLayoutState();
}

class _UserDefaultLayoutState extends State<UserDefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(ColorEnum.deepLilac.value),
                Color(ColorEnum.bluishPurple.value),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                primary: false,
                title: widget.appBarTitle,
                backgroundColor: Colors.transparent,
                elevation: 10,
              )
            ],
          ),
        ),
      ),
      body: widget.child,
    );
  }
}

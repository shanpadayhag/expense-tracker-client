import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserDefaultLayout extends StatelessWidget {
  final Widget child;
  final Widget appBarTitle;

  const UserDefaultLayout({
    Key? key,
    required this.child,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorEnum.deepLilac.value,
                    ColorEnum.bluishPurple.value,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBar(
                    title: appBarTitle,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  )
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: child,
          ),
        ));
  }
}

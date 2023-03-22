import 'package:flutter/material.dart';

class AppBarIYP extends StatelessWidget with PreferredSizeWidget {
  final Widget child;

  const AppBarIYP({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: SizedBox(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              child
              /*
          Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
            color: Colors.black,
          ),
          */
            ]),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

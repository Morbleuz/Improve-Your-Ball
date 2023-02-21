import 'package:flutter/material.dart';

class AppBarIYP extends StatelessWidget with PreferredSizeWidget {
  const AppBarIYP({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: SizedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
            color: Colors.black,
          ),
        ]),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

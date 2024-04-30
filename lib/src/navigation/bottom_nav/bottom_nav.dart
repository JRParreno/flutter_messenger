import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_messenger/gen/colors.gen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

  final int activeIndex;
  final Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      enableFeedback: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_fill),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bolt_fill),
          label: 'Highlights',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_rounded),
          label: 'People',
        ),
      ],
      currentIndex: activeIndex,
      selectedItemColor: ColorName.primary,
      onTap: onTap,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_messenger/core/config/app_constant.dart';
import 'package:flutter_messenger/src/navigation/drawer/presentation/drawer_profile_menu.dart';
import 'package:flutter_messenger/src/navigation/drawer/presentation/drawer_tile.dart';
import 'package:gap/gap.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 12,
        right: 12,
      ),
      child: Column(
        children: [
          const DrawerProfileMenu(
            fullName: 'Jhon Rhay Parreño',
            urlPhoto: AppConstant.myPhoto,
          ),
          const Gap(20),
          DrawerTile(
            isActive: true,
            icon: CupertinoIcons.chat_bubble_fill,
            onTap: () {},
            title: 'Chats',
            badgeCount: '2',
          ),
          const Gap(5),
          DrawerTile(
            icon: Icons.store,
            onTap: () {},
            title: 'Marketplace',
          ),
        ],
      ),
    );
  }
}

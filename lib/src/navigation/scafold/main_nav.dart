import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_messenger/gen/colors.gen.dart';

import 'package:flutter_messenger/src/navigation/bottom_nav/bottom_nav.dart';
import 'package:flutter_messenger/src/navigation/drawer/presentation/drawer_menu.dart';
import 'package:flutter_messenger/src/navigation/drawer/presentation/sliding_drawer.dart';
import 'package:flutter_messenger/src/navigation/scafold/widgets/chats_appbar.dart';

class MainNav extends StatefulWidget {
  const MainNav({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _activeIndex = 0;
  final slidingDrawerKey = GlobalKey<SlidingDrawerState>();

  @override
  Widget build(BuildContext context) {
    return SlidingDrawer(
      key: slidingDrawerKey,
      drawer: const DrawerMenu(),
      drawerWidth: MediaQuery.of(context).size.width * 0.85,
      swipeSensitivity: 75,
      child: Scaffold(
        appBar: appbars(context)[_activeIndex],
        body: widget.child,
        bottomNavigationBar: BottomNav(
          activeIndex: _activeIndex,
          onTap: (int value) {
            setState(() {
              _activeIndex = value;
            });
          },
        ),
      ),
    );
  }

  List<PreferredSizeWidget> appbars(BuildContext context) {
    return [
      chatsAppBar(
        onTapLead: handleOpenDrawer,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.pencil,
              color: ColorName.primary,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
        context: context,
        title: 'Chats',
      ),
      chatsAppBar(
        onTapLead: handleOpenDrawer,
        actions: [],
        context: context,
        title: 'Highlights',
      ),
      chatsAppBar(
        onTapLead: handleOpenDrawer,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.perm_contact_cal,
              color: ColorName.primary,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
        context: context,
        title: 'People',
      ),
    ];
  }

  void handleOpenDrawer() {
    slidingDrawerKey.currentState?.toggleDrawer();
  }
}

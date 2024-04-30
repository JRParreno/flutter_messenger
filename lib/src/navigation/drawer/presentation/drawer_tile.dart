import 'package:flutter/material.dart';
import 'package:flutter_messenger/gen/colors.gen.dart';
import 'package:gap/gap.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.badgeCount,
    this.isActive = false,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final String? badgeCount;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      enableFeedback: true,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 7),
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff8E8E93).withOpacity(0.2),
              )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff8E8E93).withOpacity(0.25),
                  ),
                  child: Icon(
                    icon,
                    size: 18,
                  ),
                ),
                const Gap(10),
                Text(title),
              ],
            ),
            if (badgeCount != null) drawerBadge(badgeCount!),
          ],
        ),
      ),
    );
  }

  Widget drawerBadge(String badge) {
    return Container(
      height: 20,
      width: 20,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: ColorName.primary),
      child: Center(
        child: Text(
          badge,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

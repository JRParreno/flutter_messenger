import 'package:flutter/material.dart';
import 'package:flutter_messenger/gen/colors.gen.dart';

PreferredSizeWidget chatsAppBar({
  required BuildContext context,
  required String title,
  required List<Widget> actions,
  required VoidCallback onTapLead,
}) {
  return AppBar(
    toolbarHeight: kToolbarHeight,
    titleSpacing: 0,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.menu_rounded,
        size: 30,
        color: ColorName.primary,
      ),
      onPressed: onTapLead,
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: .3,
      ),
    ),
    actions: actions,
  );
}

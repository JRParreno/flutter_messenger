import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_messenger/gen/assets.gen.dart';
import 'package:flutter_messenger/gen/colors.gen.dart';
import 'package:gap/gap.dart';

class DrawerProfileMenu extends StatelessWidget {
  const DrawerProfileMenu({
    super.key,
    required this.urlPhoto,
    required this.fullName,
  });

  final String urlPhoto;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    38,
                  ),
                ),
                padding: EdgeInsets.zero,
                child: Image.network(
                  urlPhoto,
                  height: 38,
                  width: 38,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Assets.images.profile.defaultProfile.image(
                    height: 38,
                    width: 38,
                  ),
                ),
              ),
              const Gap(10),
              Text(
                fullName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                CupertinoIcons.chevron_down,
                size: 17,
              ),
            ],
          ),
          const Icon(
            Icons.settings,
            color: ColorName.primary,
            size: 27,
          ),
        ],
      ),
    );
  }
}

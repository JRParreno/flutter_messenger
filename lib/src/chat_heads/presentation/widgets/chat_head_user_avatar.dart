import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_messenger/gen/assets.gen.dart';
import 'package:flutter_messenger/gen/colors.gen.dart';

import 'package:flutter_messenger/src/chat_heads/domain/entities/chat_head.dart';
import 'package:gap/gap.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ChatHeadUserAvatar extends StatelessWidget {
  const ChatHeadUserAvatar({
    super.key,
    required this.chatHead,
    required this.onTap,
  });

  final ChatHead chatHead;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    65,
                  ),
                ),
                padding: EdgeInsets.zero,
                child: chatHead.profilePhoto != null
                    ? Image.network(
                        chatHead.profilePhoto!,
                        height: 65,
                        width: 65,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Assets.images.profile.defaultProfile.image(
                          height: 65,
                          width: 65,
                        ),
                      )
                    : Assets.images.profile.defaultProfile.image(
                        height: 65,
                        width: 65,
                      ),
              ),
              Positioned(
                top: -10,
                left: -3,
                child: SimpleShadow(
                  opacity: 0.5,
                  offset: const Offset(0, 0),
                  child: Assets.svgs.addNote.svg(),
                ),
              ),
            ],
          ),
          const Gap(5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: FittedBox(
              child: Text(
                'Your note',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: ColorName.placeHolder),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

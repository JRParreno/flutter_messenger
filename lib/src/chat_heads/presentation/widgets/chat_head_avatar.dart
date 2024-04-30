import 'package:flutter/material.dart';
import 'package:flutter_messenger/gen/assets.gen.dart';
import 'package:flutter_messenger/gen/colors.gen.dart';

import 'package:flutter_messenger/src/chat_heads/domain/entities/chat_head.dart';
import 'package:gap/gap.dart';

class ChatHeadAvatar extends StatelessWidget {
  const ChatHeadAvatar({
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
              if (chatHead.isOnline) ...[
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: ColorName.onlineStatus,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 3)),
                  ),
                )
              ],
            ],
          ),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              chatHead.fullName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

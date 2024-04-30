import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/core/config/app_constant.dart';
import 'package:flutter_messenger/dependency_injection_config.dart';
import 'package:flutter_messenger/src/chat_heads/domain/entities/chat_head.dart';
import 'package:flutter_messenger/src/chat_heads/presentation/bloc/chat_heads_bloc.dart';
import 'package:flutter_messenger/src/chat_heads/presentation/widgets/chat_head_avatar.dart';
import 'package:flutter_messenger/src/chat_heads/presentation/widgets/chat_head_user_avatar.dart';
import 'package:gap/gap.dart';

class ChatHeads extends StatelessWidget {
  const ChatHeads({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChatHeadsBloc>(),
      child: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<ChatHeadsBloc, ChatHeadsState>(
          builder: (context, state) {
            if (state is ChatHeadsError) {
              return Text(state.errorMessage);
            }
            if (state is ChatHeadsLoaded) {
              return ListView.separated(
                itemCount: state.chatHeadModel.chatHeads.length + 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const Gap(14);
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    const item = ChatHead(
                        id: '-1',
                        fullName: 'Jhon Rhay Parreño',
                        lastMessage: '',
                        isOnline: false,
                        profilePhoto: AppConstant.myPhoto);

                    return ChatHeadUserAvatar(chatHead: item, onTap: () {});
                  }

                  final item = state.chatHeadModel.chatHeads[index - 1];

                  return ChatHeadAvatar(chatHead: item, onTap: () {});
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

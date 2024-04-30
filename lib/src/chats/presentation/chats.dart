import 'package:flutter/material.dart';
import 'package:flutter_messenger/src/chat_heads/presentation/chat_heads.dart';
import 'package:flutter_messenger/src/chats/presentation/widgets/search_field.dart';
import 'package:gap/gap.dart';

class ChatsPage extends StatefulWidget {
  static const String routeName = '/chats';
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SearchField(
              readOnly: true,
              hintText: 'Search',
              onTap: () {},
            ),
            const Gap(16),
            const ChatHeads(),
          ],
        ),
      ),
    );
  }
}

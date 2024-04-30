import 'package:flutter_messenger/gen/assets.gen.dart';
import 'package:flutter_messenger/src/chat_heads/data/models/chat_head_model.dart';
import 'package:flutter_messenger/src/chat_heads/domain/entities/chat_head.dart';
import 'package:flutter_messenger/src/chat_heads/domain/repository/chat_head_repository.dart';
import 'package:flutter/services.dart' show rootBundle;

class ChatHeadRepositoryImpl extends ChatHeadRepository {
  @override
  Future<ChatHeadModel> getChatHeads({String? nextPage}) async {
    final jsonChats = await rootBundle.loadString(Assets.json.chats);
    return ChatHeadModel.fromJson(jsonChats);
  }

  @override
  List<ChatHead> getOnlineChat(List<ChatHead> chats) {
    return chats.where((chat) => chat.isOnline).toList();
  }
}

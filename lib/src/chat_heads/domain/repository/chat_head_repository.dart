import 'package:flutter_messenger/src/chat_heads/data/models/chat_head_model.dart';
import 'package:flutter_messenger/src/chat_heads/domain/entities/chat_head.dart';

abstract class ChatHeadRepository {
  Future<ChatHeadModel> getChatHeads({String? nextPage});
  List<ChatHead> getOnlineChat(List<ChatHead> chats);
}

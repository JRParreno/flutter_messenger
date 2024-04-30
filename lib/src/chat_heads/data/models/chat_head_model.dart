import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_messenger/src/chat_heads/domain/entities/chat_head.dart';

class ChatHeadModel extends Equatable {
  final String? nextPage;
  final int totalCount;
  final List<ChatHead> chatHeads;

  const ChatHeadModel({
    this.nextPage,
    required this.totalCount,
    required this.chatHeads,
  });

  ChatHeadModel copyWith({
    String? nextPage,
    int? totalCount,
    List<ChatHead>? chatHeads,
  }) {
    return ChatHeadModel(
      nextPage: nextPage ?? this.nextPage,
      totalCount: totalCount ?? this.totalCount,
      chatHeads: chatHeads ?? this.chatHeads,
    );
  }

  factory ChatHeadModel.fromMap(Map<String, dynamic> map) {
    return ChatHeadModel(
      nextPage: map['next'],
      totalCount: map['total_count']?.toInt() ?? 0,
      chatHeads:
          List<ChatHead>.from(map['results']?.map((x) => ChatHead.fromMap(x))),
    );
  }

  factory ChatHeadModel.fromJson(String source) =>
      ChatHeadModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChatHeadModel(nextPage: $nextPage, totalCount: $totalCount, chatHeads: $chatHeads)';

  @override
  List<Object?> get props => [nextPage, totalCount, chatHeads];
}

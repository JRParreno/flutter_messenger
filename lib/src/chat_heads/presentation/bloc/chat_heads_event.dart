part of 'chat_heads_bloc.dart';

abstract class ChatHeadsEvent extends Equatable {
  const ChatHeadsEvent();

  @override
  List<Object> get props => [];
}

class OnGetChatHeads extends ChatHeadsEvent {}

part of 'chat_heads_bloc.dart';

abstract class ChatHeadsState extends Equatable {
  const ChatHeadsState();

  @override
  List<Object> get props => [];
}

class ChatHeadsInitial extends ChatHeadsState {}

class ChatHeadsLoading extends ChatHeadsState {}

class ChatHeadsError extends ChatHeadsState {
  final String errorMessage;
  const ChatHeadsError({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}

class ChatHeadsLoaded extends ChatHeadsState {
  final ChatHeadModel chatHeadModel;

  const ChatHeadsLoaded({
    required this.chatHeadModel,
  });

  @override
  List<Object> get props => [chatHeadModel];
}

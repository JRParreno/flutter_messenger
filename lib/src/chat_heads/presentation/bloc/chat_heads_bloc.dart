import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/src/chat_heads/data/models/chat_head_model.dart';
import 'package:flutter_messenger/src/chat_heads/domain/repository/chat_head_repository.dart';

part 'chat_heads_event.dart';
part 'chat_heads_state.dart';

class ChatHeadsBloc extends Bloc<ChatHeadsEvent, ChatHeadsState> {
  final ChatHeadRepository _repository;

  ChatHeadsBloc(this._repository) : super(ChatHeadsInitial()) {
    on<OnGetChatHeads>(_onGetChatHeads);
  }

  Future<void> _onGetChatHeads(
      OnGetChatHeads event, Emitter<ChatHeadsState> emit) async {
    emit(ChatHeadsLoading());

    final response = await _repository.getChatHeads();

    emit(
      ChatHeadsLoaded(
        chatHeadModel: response.copyWith(
          chatHeads: _repository.getOnlineChat(response.chatHeads),
        ),
      ),
    );
  }
}

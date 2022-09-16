import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_user_list/services/models/item_info_model.dart';
import 'package:meta/meta.dart';

import '../../services/repository/repository.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<GetUserListEvent, UserListState> {
  final ApiRepository _apiRepository;
  UserListBloc(this._apiRepository) : super(UserListInitialState()) {
    on<GetUserListEvent>((event, emit) async {
      emit(UserListInitialState());
      emit(UserListLoadingState());
      try {
        final userList = await _apiRepository.getUserList();
        emit(UserListLoadedState(userList));
      } catch (e) {
        emit(UserListErrorState(e.toString()));
      }
    });
  }
}

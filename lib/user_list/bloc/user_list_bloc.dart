import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/models/models.dart';
import '../../services/repository/repository.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<GetUserListEvent, UserListState> {
  final ApiRepository _apiRepository;
  int i = 0;
  List<ItemInfoModel> userListPag = [];
  UserListBloc(this._apiRepository) : super(UserListInitialState()) {
    on<GetUserListEvent>((event, emit) async {
      // emit(UserListInitialState());
      emit(UserListLoadingState());
      try {
        i++;
        log(i.toString());

        final userList = await _apiRepository.getUserList(countPage: i);
        userListPag.addAll(userList);
        emit(UserListLoadedState(userListPag));
      } catch (e) {
        emit(UserListErrorState(e.toString()));
      }
    });
  }
}

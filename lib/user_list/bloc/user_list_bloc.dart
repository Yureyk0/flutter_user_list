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

  UserListBloc(this._apiRepository) : super(UserListInitialState()) {
    on<GetUserListEvent>((event, emit) async {
      if (state is UserListLoadingState) return;
      final currentState = state;
      List<ItemInfoModel> oldUserList = [];
      if (currentState is UserListLoadedState) {
        oldUserList = currentState.usersList;
      }
      // emit(UserListInitialState());
      emit(UserListLoadingState(oldUserList, isFirstFetch: i == 1));
      try {
        i++;
        log(i.toString());
        if (i == 1) {
          i++;
          await getUserList();
        }
        emit(UserListLoadedState(await getUserList()));
      } catch (e) {
        emit(UserListErrorState(e.toString()));
      }
    });
  }
  Future<List<ItemInfoModel>> getUserList() async {
    final List<ItemInfoModel> newUserList =
        await _apiRepository.getUserList(countPage: i);
    final List<ItemInfoModel> userList =
        (state as UserListLoadingState).oldUserList;
    userList.addAll(newUserList);
    return userList;
  }
}

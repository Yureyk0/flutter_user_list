part of 'user_list_bloc.dart';

@immutable
abstract class UserListState extends Equatable {}

class UserListInitialState extends UserListState {
  @override
  List<Object?> get props => [];
}

class UserListLoadingState extends UserListState {
  final List<ItemInfoModel> oldUserList;
  final bool isFirstFetch;

  UserListLoadingState(this.oldUserList, {this.isFirstFetch = false});
  @override
  List<Object?> get props => [oldUserList, isFirstFetch];
}

class UserListLoadedState extends UserListState {
  final List<ItemInfoModel> usersList;

  UserListLoadedState(this.usersList);
  @override
  List<Object?> get props => [usersList];
}

class UserListErrorState extends UserListState {
  final String error;

  UserListErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

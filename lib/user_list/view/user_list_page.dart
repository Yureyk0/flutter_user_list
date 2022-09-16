import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_list/services/repository/repository.dart';
import 'package:flutter_user_list/user_list/bloc/user_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_user_list/user_list/widgets/widgets.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserListBloc>(
      create: (context) =>
          UserListBloc(RepositoryProvider.of(context))..add(GetUserListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User list=)'),
          centerTitle: true,
        ),
        body: BlocConsumer<UserListBloc, UserListState>(
          listener: (context, state) => log('message'),
          builder: (context, state) {
            if (state is UserListLoadingState) {
              return UsersListLoading();
            }
            if (state is UserListLoadedState) {
              log(state.usersList[0].user!.name.toString());
            }
            if (state is UserListErrorState) {
              log('error');
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

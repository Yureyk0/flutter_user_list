import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_list/services/models/item_info_model.dart';
import 'package:flutter_user_list/user_list/bloc/user_list_bloc.dart';

import 'package:flutter_user_list/user_list/widgets/widgets.dart';

import '../../user_image/user_image.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserListBloc>(
      create: (context) =>
          UserListBloc(RepositoryProvider.of(context))..add(GetUserListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User list=)'),
          centerTitle: true,
        ),
        body: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            if (state is UserListErrorState) {
              const UsersListError();
            }
            if (state is UserListLoadingState && state.isFirstFetch) {
              return const UsersListLoading();
            }

            List<ItemInfoModel> userList = [];
            bool isLoading = false;

            if (state is UserListLoadingState) {
              userList = state.oldUserList;
              isLoading = true;
            } else if (state is UserListLoadedState) {
              userList = state.usersList;
            }
            final controllerUserList = ScrollController();
            controllerUserList.addListener(() {
              if (controllerUserList.position.maxScrollExtent ==
                  controllerUserList.offset) {
                context.read<UserListBloc>().add(GetUserListEvent());
              }
            });

            @override
            void dispoce() {
              controllerUserList.dispose();
              super.dispose();
            }

            return ListView.builder(
              itemCount: userList.length,
              controller: controllerUserList,
              itemBuilder: (_, index) {
                if (index < userList.length) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserImagePage(
                              url: userList[index].urls!.regular)));
                    },
                    child: Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].user!.name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${userList[index].user!.profileImage!.medium}'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  );
                } else {
                  Timer(const Duration(milliseconds: 30), () {
                    controllerUserList
                        .jumpTo(controllerUserList.position.maxScrollExtent);
                  });

                  return const UsersListLoading();
                }
              },
            );
          },
        ),
      ),
    );
  }
}

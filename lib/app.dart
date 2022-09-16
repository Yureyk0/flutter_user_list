import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_list/services/repository/repository.dart';
import 'package:flutter_user_list/user_list/user_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider<ApiRepository>(
        create: (context) => ApiRepository(),
        child: const UserListPage(),
      ),
    );
  }
}

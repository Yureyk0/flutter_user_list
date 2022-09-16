import 'package:flutter/material.dart';

class UsersListLoading extends StatelessWidget {
  const UsersListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Loading',
            style: theme.textTheme.headline5,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UsersListLoading extends StatelessWidget {
  const UsersListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

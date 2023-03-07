import 'package:flutter/material.dart';
import 'package:q3/user.dart';

import 'user_service.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final userService = UserService();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await userService.getUsers();
    setState(() {
      _users = users;
    });
  }

  Future<void> _handleRefresh() async {
    await _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            final user = _users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: Text(user.source),
            );
          },
        ),
      ),
    );
  }
}

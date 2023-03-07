import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:q3/user.dart';
import 'package:path_provider/path_provider.dart';

class UserService {
  Future<List<User>> getUsers() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final usersFile = File('${appDirectory.path}/users.json');

    if (!await usersFile.exists()) {
      await usersFile.create(recursive: true);
    }

    final usersJson = await usersFile.readAsString();
    final usersList =
        usersJson.isEmpty ? [] : json.decode(usersJson) as List<dynamic>;
    return usersList.map((userJson) => User.fromJson(userJson)).toList();
  }

  Future<void> addUser(User user) async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final usersFile = File('${appDirectory.path}/users.json');

    final usersJson = await usersFile.readAsString();
    final usersList =
        usersJson.isEmpty ? [] : json.decode(usersJson) as List<dynamic>;
    final users = usersList.map((userJson) => User.fromJson(userJson)).toList();
    users.add(user);
    final newUsersJson =
        json.encode(users.map((user) => user.toJson()).toList());
    await usersFile.writeAsString(newUsersJson);
  }
}

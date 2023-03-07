import 'package:flutter/material.dart';
import 'package:q3/user.dart';

import 'user_service.dart';


class HomeScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _userService = UserService();

  String _name = '';
  String _email = '';
  String _source = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Tracker App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Where are you coming from?',
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'Facebook',
                      child: Text('Facebook'),
                    ),
                    DropdownMenuItem(
                      value: 'Instagram',
                      child: Text('Instagram'),
                    ),
                    DropdownMenuItem(
                      value: 'Organic',
                      child: Text('Organic'),
                    ),
                    DropdownMenuItem(
                      value: 'Friend',
                      child: Text('Friend'),
                    ),
                    DropdownMenuItem(
                      value: 'Google',
                      child: Text('Google'),
                    ),
                  ],
                  validator: (value) {
                    if (value == null) {
                      return 'Please choose an option';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _source = value!;
                  },
                  onSaved: (value) {
                    _source = value!;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _userService.addUser(User(_name, _email, _source));
                      Navigator.pushNamed(context, '/userList');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

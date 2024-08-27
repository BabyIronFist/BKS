import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户信息'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          '用户信息页面',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

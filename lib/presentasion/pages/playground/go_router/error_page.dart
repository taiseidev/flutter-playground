import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({
    Key? key,
    required this.message,
  }) : super(key: key);
  String message;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(message),
      ),
    );
  }
}

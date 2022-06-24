import 'package:flutter/widgets.dart';

class GoRouterErrorPage extends StatelessWidget {
  GoRouterErrorPage({Key? key, required this.message}) : super(key: key);
  String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}

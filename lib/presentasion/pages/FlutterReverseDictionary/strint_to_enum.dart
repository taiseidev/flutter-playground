import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/presentasion/pages/FlutterReverseDictionary/want_to_do_hot_reload_in_dialog.dart';

// apiから帰ってくる値をあらかじめ定義
enum Job {
  engineer,
  teacher,
  fireman,
  dancer,
  policeman,
  actor,
}

// Job string2Job(String value) {
//   switch (value) {
//     case 'engineer':
//       return Job.engineer;
//     case 'teacher':
//       return Job.teacher;
//     case 'fireman':
//       return Job.fireman;
//     case 'dancer':
//       return Job.dancer;
//     case 'policeman':
//       return Job.policeman;
//     case 'actor':
//       return Job.actor;
//     default:
//       throw Exception('No enum value');
//   }
// }

const json = '''
{
  "name": "taisei",
  "job": "engineer"
}
''';

// userモデルを定義
class User {
  User({
    required this.name,
    required this.job,
  });

  final String name;
  final String job;

  factory User.fromJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return User(
      name: map['name'],
      // job: string2Job(map['job']) as String,
      job: Job.values.byName(map['job']).toString(),
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '私の名前は$nameで、$jobをしています。';
  }
}

class StrintToEnum extends StatefulWidget {
  const StrintToEnum({Key? key}) : super(key: key);

  @override
  State<StrintToEnum> createState() => _StrintToEnumState();
}

class _StrintToEnumState extends State<StrintToEnum> {
  late User introduction;
  @override
  void initState() {
    super.initState();
    introduction = User.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(introduction.toString()),
            Text(introduction.name),
            Text(introduction.job),
          ],
        ),
      ),
    );
  }
}

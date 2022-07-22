import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AutocompleteSample(),
    );
  }
}

// ----------------------
// 基本的な使い方

class AutocompleteExample extends StatelessWidget {
  const AutocompleteExample({Key? key}) : super(key: key);

  static const _sports = <String>[
    'football',
    'baseball',
    'tennis',
    'swimming',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return _sports.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String value) {
            // 候補選択時に呼び出されます。
            print('$valueを選択しました！');
          },
        ),
      ),
    );
  }
}

// ----------------------
// モデルを作ったやり方

class CustomAutocompleteExample extends StatelessWidget {
  CustomAutocompleteExample({Key? key}) : super(key: key);

  final users = <User>[
    User(name: 'Aくん', mail: 'akun@sample.com'),
    User(name: 'Bくん', mail: 'bkun@sample.com'),
    User(name: 'Cくん', mail: 'ckun@sample.com'),
  ];

  static String _displayStringForOption(User option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Autocomplete<User>(
          displayStringForOption: _displayStringForOption,
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<User>.empty();
            }
            return users.where((User option) {
              return option.name.toString().contains(textEditingValue.text);
            });
          },
          // 選択した値が入る
          onSelected: (User user) {
            print('${user.name}を選択しました！');
          },
        ),
      ),
    );
  }
}

class User {
  User({
    required this.name,
    required this.mail,
  });
  String name;
  String mail;
}

// ----------------------
// 候補の見た目をカスタマイズ
class CustomDisplayAutocompleteExample extends StatelessWidget {
  CustomDisplayAutocompleteExample({Key? key}) : super(key: key);

  final users = <User>[
    User(name: 'Aくん', mail: 'akun@sample.com'),
    User(name: 'Bくん', mail: 'bkun@sample.com'),
    User(name: 'Cくん', mail: 'ckun@sample.com'),
  ];

  static String _displayStringForOption(User option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Autocomplete<User>(
            displayStringForOption: _displayStringForOption,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<User>.empty();
              }
              return users.where((User option) {
                return option.name.toString().contains(textEditingValue.text);
              });
            },
            onSelected: (User user) {
              print('${user.name}を選択しました');
            },
            optionsViewBuilder: (context, onSelected, users) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: ((context, index) {
                  final userList = users.toList();
                  return MyWidget(userList[index]);
                }),
              );
            }),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget(this.user);
  User user;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.mail),
      ),
    );
  }
}

// ----------------------
// フォームの見た目をカスタマイズ
class CosutomFormAutocompleteExample extends StatelessWidget {
  const CosutomFormAutocompleteExample({Key? key}) : super(key: key);

  static const _sports = <String>[
    'football',
    'baseball',
    'tennis',
    'swimming',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Autocomplete<String>(
          displayStringForOption: (option) {
            return option;
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            // 未入力の場合は自動補完を走らせない
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return _sports.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 2.0,
                  ),
                ),
                labelStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.green[300],
                ),
                labelText: 'フレームあり、ラベルあり',
                floatingLabelStyle: const TextStyle(fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.green[100]!,
                    width: 1.0,
                  ),
                ),
              ),
            );
          },
          // 選択した値が入る
          onSelected: (String selection) {
            print('$selectionを選択しました！');
          },
        ),
      ),
    );
  }
}

// ----------------------
// 活用例1

class AutocompleteSample extends StatefulWidget {
  const AutocompleteSample({Key? key}) : super(key: key);

  @override
  State<AutocompleteSample> createState() => _AutocompleteSampleState();
}

class _AutocompleteSampleState extends State<AutocompleteSample> {
  List<String> mails = [];

  Future<void> getMail() async {
    final prefs = await SharedPreferences.getInstance();
    final mail = prefs.getString('mail');
    if (mail != null) {
      mails.add(mail);
    }
  }

  @override
  void initState() {
    super.initState();
    getMail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return mails.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            print('$selectionを選択しました！');
          },
        ),
      ),
    );
  }
}

// ----------------------
// 活用例2

class AutocompleteSample2 extends StatelessWidget {
  const AutocompleteSample2({Key? key}) : super(key: key);

  static const _sports = <String>[
    'football',
    'baseball',
    'tennis',
    'swimming',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return _sports.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }, onSelected: (String value) {
          // 候補選択時に呼び出されます。
          print('$valueを選択しました！');
        }, optionsViewBuilder: (context, onSelected, values) {
          return Material(
            child: Wrap(
              children: [
                for (final value in values)
                  Chip(
                    label: Text(value),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final itemList = [
    Item(
        name: '田中',
        age: 12,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/11/08/05/31/boys-1807545_1280.jpg'),
    Item(
        name: '小山',
        age: 13,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/05/17/26/indian-1717192_1280.jpg'),
    Item(
        name: '鈴木',
        age: 26,
        imageUrl:
            'https://images.unsplash.com/photo-1526080652727-5b77f74eacd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1776&q=80'),
    Item(
        name: '山本',
        age: 65,
        imageUrl:
            'https://images.unsplash.com/photo-1608649672519-e8797a9560cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1143&q=80'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Sample'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: ((context, index) {
          final item = itemList[index];
          return Card(
            child: ListTile(
              leading: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => DetailPage(item, index)),
                  ),
                ),
                child: Hero(
                  tag: 'imageUrl$index',
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(item.imageUrl),
                  ),
                ),
              ),
              title: Text(item.name),
              subtitle: Text('${item.age}歳'),
            ),
          );
        }),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  DetailPage(
    this.item,
    this.index,
  );
  Item item;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: 'imageUrl$index',
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                item.imageUrl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final int age;
  final String imageUrl;

  Item({
    required this.name,
    required this.age,
    required this.imageUrl,
  });
}


// リストを表示してるページ
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hero Sample'),
//       ),
//       body: GestureDetector(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               fullscreenDialog: true,
//               builder: (BuildContext context) => DetailPage(),
//             ),
//           );
//         },
//         child: Card(
//           margin: const EdgeInsets.all(24),
//           elevation: 4.0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           clipBehavior: Clip.antiAlias,
//           child: Hero(
//             tag: 'uniqueTag',
//             child: Image.network(
//               'https://images.unsplash.com/photo-1595581831735-ec7a54193665?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1729&q=80',
//               fit: BoxFit.cover,
//               // height: 100,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DetailPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Center(
//             child: Column(
//               children: <Widget>[
//                 Hero(
//                   tag: 'uniqueTag',
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1595581831735-ec7a54193665?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1729&q=80',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:bubble_lens/bubble_lens.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blobs/blobs.dart';
import 'Dart:math' as math;

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
      home: UiSmaple(),
    );
  }
}

final imageUrl = [
  'https://images.unsplash.com/photo-1603787081207-362bcef7c144?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
  'https://images.unsplash.com/photo-1588361861040-ac9b1018f6d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1586525198428-225f6f12cff5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  'https://images.unsplash.com/photo-1603036050141-c61fde866f5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  'https://images.unsplash.com/photo-1618677831708-0e7fda3148b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  'https://images.unsplash.com/photo-1603787081151-cbebeef20092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1587563871167-1ee9c731aefb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1431&q=80',
];

class UiSmaple extends StatefulWidget {
  @override
  State<UiSmaple> createState() => _UiSmapleState();
}

class _UiSmapleState extends State<UiSmaple>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> tabs = <Tab>[
    Tab(
      text: 'Today',
    ),
    Tab(
      text: "TimeLine",
    ),
    Tab(
      text: "Three",
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          leading: Icon(
            Icons.settings,
            size: 30,
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            '2022/07/01',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            physics: NeverScrollableScrollPhysics(),
            isScrollable: true,
            tabs: tabs,
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            // indicator: CustomTabIndicator(),
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            MyClose(),
            Center(child: Test()),
            Center(child: Test()),
          ],
        ));
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'こんにちは',
      style: TextStyle(color: Colors.white),
    );
  }
}

class MyClose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: BubbleLens(
        duration: Duration(milliseconds: 100),
        radius: const Radius.circular(50),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        widgets: [
          for (var i = 0; i < imageUrl.length; i++)
            GestureDetector(
              onTap: () {
                print(
                  Color(
                    (math.Random().nextDouble() * 0xFFFFFF).toInt() << 0,
                  ).withOpacity(1.0),
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => DetailPage(i),
                  ),
                );
              },
              child: Hero(
                tag: i,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.network(
                    imageUrl[i],
                    fit: BoxFit.cover,
                    // height: 100,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

// class UiSmaple extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         height: double.infinity,
//         child: Container(
//           color: Colors.black,
//           child: BubbleLens(
//             duration: Duration(milliseconds: 100),
//             radius: const Radius.circular(50),
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             widgets: [
//               for (var i = 0; i < imageUrl.length; i++)
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         fullscreenDialog: true,
//                         builder: (BuildContext context) => DetailPage(i),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     width: 200,
//                     height: 200,
//                     child: Hero(
//                       tag: 'profile$i',
//                       child: Image.network(
//                         imageUrl[i],
//                         fit: BoxFit.cover,
//                         // height: 100,
//                       ),
//                     ),
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class DetailPage extends StatelessWidget {
  DetailPage(this.i);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: i,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.network(
                      imageUrl[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DelayedDisplay(
                        delay: Duration(milliseconds: 500),
                        child: Text(
                          "大西 泰生",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DelayedDisplay(
                        delay: Duration(milliseconds: 600),
                        child: Text(
                          "1997年5月18日",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      DelayedDisplay(
                        delay: Duration(milliseconds: 800),
                        child: Text(
                          "コメント",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          DelayedDisplay(
                            delay: Duration(milliseconds: 1000),
                            child: Text(
                              "初めまして！！現在神奈川県に住んでいる大西泰生と申します！趣味はFlutterでアプリ開発をすることです！他にもキャンプや映画鑑賞など好きなことがたくさんあります！今後ともどうぞよろしくお願いします！",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

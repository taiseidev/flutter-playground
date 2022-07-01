import 'dart:async';

import 'package:bubble_lens/bubble_lens.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
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
      text: "other",
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
          splashFactory: NoSplash.splashFactory,
          physics: NeverScrollableScrollPhysics(),
          isScrollable: true,
          tabs: tabs,
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
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
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'test',
      style: TextStyle(color: Colors.white),
    );
  }
}

class MyClose extends StatefulWidget {
  @override
  State<MyClose> createState() => _MyCloseState();
}

class _MyCloseState extends State<MyClose> {
  double opacityLevel = 1.0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          opacityLevel = opacityLevel == 1.0 ? 0.0 : 1.0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BubbleLens(
            duration: Duration(milliseconds: 100),
            radius: const Radius.circular(50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            widgets: [
              for (var i = 0; i < imageUrl.length; i++)
                GestureDetector(
                  onTap: () {
                    // タップ時に振動
                    HapticFeedback.heavyImpact();
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrl[i]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: Duration(seconds: 1),
              child: Text(
                'Long press & Scroll',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
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

class DetailPage extends StatefulWidget {
  DetailPage(this.i);
  final int i;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  void favorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

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
                  tag: widget.i,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.network(
                      imageUrl[widget.i],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DelayedDisplay(
                            delay: Duration(milliseconds: 500),
                            child: Text(
                              "Hi!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(),
                          AnimatedSwitcher(
                            switchInCurve: Curves.elasticIn,
                            switchOutCurve: Curves.elasticOut,
                            duration: Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                child: child,
                                scale: animation,
                              );
                            },
                            child: isFavorite
                                ? IconButton(
                                    key: ValueKey('0'),
                                    onPressed: () {
                                      HapticFeedback.heavyImpact();
                                      favorite();
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                  )
                                : IconButton(
                                    key: ValueKey('1'),
                                    onPressed: () {
                                      HapticFeedback.heavyImpact();
                                      favorite();
                                    },
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      DelayedDisplay(
                        delay: Duration(milliseconds: 600),
                        child: Text(
                          "2022/07/01",
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
                          "comments",
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
                              "Hello everyone, my name is Beck. Some people find it hard to pronounce, so feel free to call me Be",
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

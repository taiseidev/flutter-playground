import 'dart:async';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:bubble_lens/bubble_lens.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blobs/blobs.dart';
import 'package:lottie/lottie.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:status_view/status_view.dart';
import 'Dart:math' as math;

void main() {
  runApp(
    MyApp(),
  );
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

class UiSmaple extends StatefulWidget {
  @override
  State<UiSmaple> createState() => _UiSmapleState();
}

class _UiSmapleState extends State<UiSmaple>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> tabs = <Tab>[
    const Tab(
      text: 'Topic',
    ),
    const Tab(
      text: "TimeLine",
    ),
    const Tab(
      text: "Favorite",
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
        leading: Badge(
          position: BadgePosition.topEnd(
            top: 5,
            end: 0,
          ),
          badgeContent: const Text(
            '2',
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(
            onPressed: (() => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NotificationPage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // final Offset begin = Offset(0.0, 1.0); // 右から左
                      const Offset begin = Offset(-1.0, 0.0); // 左から右
                      const Offset end = Offset.zero;
                      final Animatable<Offset> tween =
                          Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: Curves.easeInOut));
                      final Animation<Offset> offsetAnimation =
                          animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                )),
            icon: const Icon(
              Icons.notifications,
              size: 40,
            ),
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => ProfilePage()),
              ),
            ),
            child: const Hero(
              tag: 'profile',
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1411&q=80'),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        title: const Text(
          '2022/07/01',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          splashFactory: NoSplash.splashFactory,
          physics: const NeverScrollableScrollPhysics(),
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
          TopicPage(),
          MyClose(_tabController.index),
          FavoritePage(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.red,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20), //角の丸み
      //   ),
      //   onPressed: () {},
      //   child: const Icon(Icons.camera),
      // ),
    );
  }
}

class TopicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Text(
          'テスト',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1411&q=80'),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Taisei',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          subtitle: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  imageUrl[index],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'A failure is like fertilizer. It stinks to be sure, but it makes things grow faster in the future.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.grey,
        );
      },
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'test',
      style: TextStyle(color: Colors.white),
    );
  }
}

extension _ColorExt on Color {
  Color returnColor() {
    bool isBirthday = true;
    if (isBirthday == true) {
      return const Color(0xffF0E68C);
    }
    return const Color(0xff000000);
  }
}

class MyClose extends StatefulWidget {
  MyClose(this.index);
  int index;

  @override
  State<MyClose> createState() => _MyCloseState();
}

class _MyCloseState extends State<MyClose> {
  double opacityLevel = 1.0;
  late int currentTab;
  final bool _filter = false;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    currentTab = widget.index;
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
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              BubbleLens(
                duration: const Duration(milliseconds: 100),
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
                  duration: const Duration(seconds: 1),
                  child: const Text(
                    'Long press & Scroll',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // 未投稿の場合はFilterをかけるようにする
        if (_filter)
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
        if (_filter)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Can't watch the post",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  48,
                  24,
                  48,
                  0,
                ),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Post Now',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: buildAppBar(context),
        body: Stack(
          children: [
            // Lottie.network(
            //   'https://assets10.lottiefiles.com/packages/lf20_llqi3lop.json',
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_oolltm56.json',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Lottie.network(
            //   'https://assets9.lottiefiles.com/packages/lf20_dvaa7eik.json',
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            // Lottie.network(
            //   'https://assets7.lottiefiles.com/packages/lf20_k2yibw56.json',
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            // Lottie.network(
            //   'https://assets7.lottiefiles.com/packages/lf20_1m5nibfw.json',
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Hero(
                  tag: 'profile',
                  child: GestureDetector(
                    onTap: () {},
                    child: StatusView(
                      radius: 70,
                      spacing: 15,
                      strokeWidth: 3,
                      indexOfSeenStatus: 2,
                      numberOfStatus: 5,
                      padding: 10,
                      centerImageUrl:
                          'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1411&q=80',
                      seenColor: Colors.grey,
                      unSeenColor: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                buildName(),
                const SizedBox(height: 24),
                Center(child: buildUpgradeButton()),
                const SizedBox(height: 24),
                NumbersWidget(),
                const SizedBox(height: 48),
                buildAbout(),
              ],
            ),
          ],
        ));
  }

  Widget buildName() => Column(
        children: [
          const Text(
            'Taisei',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'ID:5947596159-74531902',
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => Column(
        children: [
          const Text(
            'FREE',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
              onPressed: () {}, child: const Text('become a paying member?'))
        ],
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Hi! I'm Flutter engineer.",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.4,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}

AppBar buildAppBar(BuildContext context) {
  const icon = Icons.settings;

  return AppBar(
    leading: const BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => SettingPage()),
          ),
        ),
      ),
    ],
  );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onClicked,
      );
}

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '102', 'Post'),
          buildDivider(),
          buildButton(context, '35', 'Following'),
          buildDivider(),
          buildButton(context, '50', 'Followers'),
        ],
      );
  Widget buildDivider() => Container(
        height: 24,
        child: const VerticalDivider(
          color: Colors.white,
        ),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}

class SettingPage extends StatelessWidget {
  Color testColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            '設定画面',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget TestContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: testColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  FloatingActionButton buildFloating() {
    return FloatingActionButton(
      backgroundColor: testColor,
      onPressed: () {},
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: widget.i,
                  child: Image.network(
                    imageUrl[widget.i],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const DelayedDisplay(
                            delay: const Duration(milliseconds: 500),
                            child: const Text(
                              "Hi!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          AnimatedSwitcher(
                            switchInCurve: Curves.elasticIn,
                            switchOutCurve: Curves.elasticOut,
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                child: child,
                                scale: animation,
                              );
                            },
                            child: isFavorite
                                ? IconButton(
                                    key: const ValueKey('0'),
                                    onPressed: () {
                                      HapticFeedback.heavyImpact();
                                      favorite();
                                    },
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                  )
                                : IconButton(
                                    key: const ValueKey('1'),
                                    onPressed: () {
                                      HapticFeedback.heavyImpact();
                                      favorite();
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.comment,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled:
                                      true, //trueにしないと、Containerのheightが反映されない
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.vertical(
                                        top: const Radius.circular(15)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 300,
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const DelayedDisplay(
                        delay: const Duration(milliseconds: 600),
                        child: const Text(
                          "2022/07/01",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const DelayedDisplay(
                        delay: const Duration(milliseconds: 800),
                        child: const Text(
                          "comments",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          const DelayedDisplay(
                            delay: const Duration(milliseconds: 1000),
                            child: Text(
                              "Hello everyone, my name is Beck. Some people find it hard to pronounce, so feel free to call me Be",
                              style: const TextStyle(
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

// 自作でNavigatorをいじってみる
// https://zenn.dev/pressedkonbu/books/flutter-reverse-lookup-dictionary/viewer/025-custom-page-route

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> tabs = [
    const Tab(
      text: 'All',
    ),
    const Tab(
      text: 'System',
    ),
  ];
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          splashFactory: NoSplash.splashFactory,
          physics: const NeverScrollableScrollPhysics(),
          isScrollable: true,
          tabs: tabs,
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
        ),
      ),
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: ((context, index) => const ListTile(
              leading: const CircleAvatar(
                radius: 15,
                backgroundImage: const NetworkImage(
                    'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1411&q=80'),
              ),
              title: const Text(
                'Taisei Onishi favored it.',
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'The weather was nice and we visited a natural park to see koalas. ',
                style: const TextStyle(color: Colors.grey),
              ),
            )),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.grey,
          );
        },
      ),
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
  'https://images.unsplash.com/photo-1496302662116-35cc4f36df92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=699&q=80',
  'https://images.unsplash.com/photo-1500259783852-0ca9ce8a64dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
  'https://images.unsplash.com/photo-1648737964403-a6a32ab43e53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
  'https://images.unsplash.com/photo-1496302662116-35cc4f36df92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=699&q=80',
  'https://images.unsplash.com/photo-1500259783852-0ca9ce8a64dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
  'https://images.unsplash.com/photo-1648737964403-a6a32ab43e53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
  'https://images.unsplash.com/photo-1603787081151-cbebeef20092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1587563871167-1ee9c731aefb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1431&q=80',
  'https://images.unsplash.com/photo-1496302662116-35cc4f36df92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=699&q=80',
  'https://images.unsplash.com/photo-1500259783852-0ca9ce8a64dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
  'https://images.unsplash.com/photo-1648737964403-a6a32ab43e53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
  'https://images.unsplash.com/photo-1496302662116-35cc4f36df92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=699&q=80',
  'https://images.unsplash.com/photo-1500259783852-0ca9ce8a64dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
  'https://images.unsplash.com/photo-1648737964403-a6a32ab43e53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
  'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
  'https://images.unsplash.com/photo-1648737964403-a6a32ab43e53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
  'https://images.unsplash.com/photo-1496302662116-35cc4f36df92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=699&q=80',
  'https://images.unsplash.com/photo-1500259783852-0ca9ce8a64dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
  'https://images.unsplash.com/photo-1648737964403-a6a32ab43e53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
];

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UiSmaple(),
    );
  }
}

class UiSmaple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Container(
            color: Colors.black,
            child: BubbleLens(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              widgets: [
                for (var i = 0; i < 10; i++)
                  GestureDetector(
                    // onTap: (() => ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         duration: const Duration(milliseconds: 500),
                    //         content: Text(i.toString()),
                    //       ),
                    //     )),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(milliseconds: 500),
                          content: Text(i.toString()),
                        ),
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) => DetailPage(i),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Hero(
                        tag: 'profile$i',
                        child: i == 0
                            ? Image.network(
                                'https://images.unsplash.com/photo-1588484628369-dd7a85bfdc38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80',
                                fit: BoxFit.cover,
                                // height: 100,
                              )
                            : Image.network(
                                'https://images.unsplash.com/photo-1595581831735-ec7a54193665?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1729&q=80',
                                fit: BoxFit.cover,
                                // height: 100,
                              ),
                      ),
                      // color: Color(
                      //   (math.Random().nextDouble() * 0xFFFFFF).toInt() << 0,
                      // ).withOpacity(1.0),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
                  tag: 'profile$i',
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1595581831735-ec7a54193665?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1729&q=80',
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
// class UiSmaple extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SizedBox(
//       height: double.infinity,
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               Blob.fromID(
//                 id: ['12-5-36'],
//                 size: 400,
//               ),
//               DelayedDisplay(
//                 delay: Duration(seconds: 1),
//                 slidingCurve: Curves.slowMiddle,
//                 child: Text(
//                   "Hello",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 35.0,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // SvgPicture.asset(
//           //   'assets/test.svg',
//           // ),
//         ],
//       ),
//     ));
//   }
// }

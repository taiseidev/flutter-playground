import 'package:flutter/material.dart';

class ListStoreLocation extends StatelessWidget {
  ListStoreLocation({Key? key}) : super(key: key);
  final myTabs = [
    const Tab(text: '0'),
    const Tab(text: '1'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: myTabs),
        ),
        body: const TabBarView(
          children: [
            MyTab(
              tabIndex: 0,
            ),
            MyTab(
              tabIndex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  const MyTab({required this.tabIndex});
  final int tabIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('tabIndex:$tabIndex index:$index'),
            ),
          );
        });
  }
}

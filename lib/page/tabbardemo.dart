import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("tab bar demo"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.business))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Image.network(
                  'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png'),
            ),
            Container(
              child: Text("text demo"),
            ),
            Icon(Icons.favorite),
            Icon(Icons.business)
          ],
        ),
      ),
    );
  }
}

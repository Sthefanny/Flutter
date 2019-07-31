import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavbarWidget {
  List<BubbleBottomBarItem> build() {
    return <BubbleBottomBarItem>[
      BubbleBottomBarItem(
          backgroundColor: Colors.red,
          icon: Icon(Icons.dashboard, color: Colors.black),
          activeIcon: Icon(
            Icons.dashboard,
            color: Colors.red,
          ),
          title: Text("Episodes")),
      BubbleBottomBarItem(
          backgroundColor: Colors.deepPurple,
          icon: Icon(Icons.face, color: Colors.black),
          activeIcon: Icon(
            Icons.face,
            color: Colors.deepPurple,
          ),
          title: Text("Characters")),
      BubbleBottomBarItem(
          backgroundColor: Colors.indigo,
          icon: Icon(Icons.public, color: Colors.black),
          activeIcon: Icon(
            Icons.public,
            color: Colors.indigo,
          ),
          title: Text("Locations")),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';

BubbledNavigationBarItem bubbledNavigationBarItem(
  IconData icon,
  IconData activeIcon,
  String iconLabel,
) =>
    BubbledNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.all(9.0),
        child: Icon(
          icon,
          size: 33,
          color: Colors.blueAccent[700],
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.all(9.0),
        child: Icon(
          activeIcon,
          size: 33,
          color: Colors.grey[50],
        ),
      ),
      title: Padding(
        padding: EdgeInsets.all(3.0),
        child: Text(
          iconLabel,
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

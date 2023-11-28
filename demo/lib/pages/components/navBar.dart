import 'package:flutter/material.dart';

import '../Home/Home_page.dart';
import '../Home/history.dart';

import '../Home/notifications.dart';
import '../Home/person.dart';
import '../qr_scanner/qr_scanner.dart';
import '../welcome/welcome.dart';

class nav extends StatefulWidget {
  const nav({super.key});

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  List pages = [
    HomePage(),
    History(),
    QRScanner(),
    notifications(),
    account(),
  ];
  int currentIndex = 2;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // Set unselectedFontSize and selectedFontSize to a value greater than 0
        unselectedFontSize: 20, // Adjust the font size as needed
        selectedFontSize: 20,   // Adjust the font size as needed
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'bookmark', icon: Icon(Icons.bookmark)),
          BottomNavigationBarItem(label: 'qrcode', icon: Icon(Icons.qr_code)),
          BottomNavigationBarItem(label: 'notifications', icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(label: 'person', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

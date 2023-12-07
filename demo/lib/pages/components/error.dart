import 'package:demo/pages/login/login.dart';
import 'package:flutter/material.dart';

import 'navBar.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/image/logo/5_Something Wrong.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7070DA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => nav(),
                  ),
                );
              },
              child: Text(
                "go back".toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

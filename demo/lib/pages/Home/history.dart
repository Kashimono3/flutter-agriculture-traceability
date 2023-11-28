import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Lịch sử tra cứu",
          style: TextStyle(
            color: Color(0xFF056762),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

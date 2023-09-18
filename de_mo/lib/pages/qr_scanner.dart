import 'package:flutter/material.dart';

class QRScanner  extends StatefulWidget {
  const QRScanner ({super.key});

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner>{
    
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children :<Widget>[
        Text("Qr"),
        ],
      )
    );
  }
}
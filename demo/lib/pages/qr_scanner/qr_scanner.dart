import 'package:demo/pages/qr_scanner/scanner_Tree.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:image_picker/image_picker.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScanner();
}

class _QRScanner extends State<QRScanner> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF01AAA0), Color(0xFFE7FEFE), Color(0xFFEEFCFB)],
        )),
        child: Scaffold(
          backgroundColor: Color(0xffEFFDF5),
          drawer: const Drawer(),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      isFlashOn = !isFlashOn;
                    });
                    cameraController.toggleTorch();
                  },
                  icon: Icon(
                    Icons.flash_on,
                    color: isFlashOn ? Colors.blue : Colors.black87,
                  )),
            ],
            iconTheme: IconThemeData(
              color: Colors.black87,
            ),
            centerTitle: true,
            title: const Text(
              "QR Scanner",
              style: TextStyle(
                color: Color(0xFF056762),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Place the QR code in the area",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Scanning will be started automatically",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300, // Adjust the width as needed
                          height: 300, // Adjust the height as needed
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            // Adjust the radius as needed
                            child: MobileScanner(
                              allowDuplicates: false,
                              controller: cameraController,
                              onDetect: _foundBarcode,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 320, // Adjust the width as needed
                          height: 320, // Adjust the height as needed
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            // Adjust the radius as needed
                            child: QRScannerOverlay(
                              borderColor: Color(0xff05986A),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Made By DLU",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ));
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    print(barcode);
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? "---";
      _screenOpened = false;
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      QRTree(closeScreen: _screenWasClosed, code: code)))
          .then((value) => print(value));
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}

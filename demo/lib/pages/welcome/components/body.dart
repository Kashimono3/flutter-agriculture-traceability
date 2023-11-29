import 'package:demo/pages/register/register.dart';
import 'package:demo/styles/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo/pages/qr_scanner/qr_scanner.dart';

import '../../components/navBar.dart';
import '../../qr_scanner/test.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(

      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Positioned(
              child: Image.asset(
            "assets/image/logo/logo.png",
            width: size.width,
            height: size.height * 0.2,
          )),
          const Positioned(
            child: Text(
              "LaFarm",
              style: TextStyle(
                color: Color(0xFF05986A),
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Positioned(
            child: Text(
              "Welcome to DLU app",
              style: TextStyle(
                color: Color(0xFF929292),
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: buttonLogin,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => nav(),
                  ),
                );
              },
              child: const Text(
                "Đăng nhập",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )),
          const SizedBox(
            height: 30,
          ),

          ElevatedButton(
              style: buttonRegister,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => nav(),
                  ),
                );
              },
              child: const Text("Khách",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ))),
        ],
      ),
    );
  }
}

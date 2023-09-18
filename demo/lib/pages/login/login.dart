import 'package:demo/styles/social.dart';
import 'package:demo/styles/textField.dart';
import 'package:flutter/material.dart';
import 'package:demo/pages/welcome/welcome.dart';

import '../../styles/button.dart';
import '../qr_scanner/qr_scanner.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFFDF5),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                onPressed: () {
                  welcome_scenner();
                  Navigator.pop(context);
                },
                icon:
                const Icon(Icons.arrow_back_ios_new, color: Colors.black54),
              ),
            );
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          const Text("Đăng nhập",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              )),
          const SizedBox(height: 15),
          textField(
            controller: emailController,
            text: 'Email',
            obscure: false,
            textInputType: TextInputType.text,
          ),
          textField(
            controller: passwordController,
            text: 'Mật khẩu',
            obscure: true,
            textInputType: TextInputType.text,
          ),

          const SizedBox(height: 15),
          ElevatedButton(
              style: buttonLogin,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRScanner(),
                  ),
                );
              },
              child: const Text("Đăng nhập",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ))),
          const SizedBox(height: 30),
          SocialLogin(),
        ]),
      ),
    );
  }
}

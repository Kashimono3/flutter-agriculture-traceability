import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../pages/register/google_sign_in.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            '--------  Hoặc  --------',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 30,),
        Row(
          children: [
            SizedBox(width: 30,),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                 final provider = Provider.of<MyGoogleSignIn>(context,listen: false);
                provider.googleLogin();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 10,
                ),
                child: SvgPicture.asset('assets/icon/Google.svg', height: 30),
              ),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add your action when the Facebook button is pressed.
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 10,
                ),
                child: SvgPicture.asset('assets/icon/facebook.svg', height: 30),
              ),
            ),
            SizedBox(width: 30,),
          ],
        ),
      ],
    );
  }
}

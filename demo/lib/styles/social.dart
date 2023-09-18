import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

              child: Container(
              alignment: Alignment.center,
              height:  55,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow:[ BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),],

              ),
              child: SvgPicture.asset('assets/icon/Google.svg',height: 30,)
            ),

            ),
            SizedBox(width: 15,),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  height:  55,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow:[ BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),],

                  ),
                  child: SvgPicture.asset('assets/icon/facebook.svg',height: 30,)
              ),

            ),
            SizedBox(width: 30,),

          ],
        ),
      ],
    );
  }
}

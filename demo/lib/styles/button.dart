import 'package:flutter/material.dart';
import 'package:demo/styles/color.dart';


final ButtonStyle buttonLogin = ElevatedButton.styleFrom(
  minimumSize:Size(335,50),
  backgroundColor: Color(0xff05986A),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50),)),
  elevation: 5,
  shadowColor: Colors.grey,
);
final ButtonStyle buttonRegister = ElevatedButton.styleFrom(
  minimumSize:Size(335,50),
  backgroundColor: Colors.white,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50),)),
  elevation: 5,
  shadowColor: Colors.grey,
);
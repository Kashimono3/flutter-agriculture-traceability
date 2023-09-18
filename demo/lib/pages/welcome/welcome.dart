import 'package:demo/pages/welcome/components/body.dart';

import 'package:flutter/material.dart';


class welcome_scenner extends StatelessWidget {
  const welcome_scenner({super.key});


  @override
  Widget build (BuildContext context){
    return const Scaffold(
      backgroundColor: Color(0xffEFFDF5),
      body: Body(),
    );
  }
}
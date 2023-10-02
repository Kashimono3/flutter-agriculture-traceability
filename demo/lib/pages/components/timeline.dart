import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'cardTimeLine.dart';

class MyTimeLineTitle extends StatelessWidget {
  final bool isFirst;
  final bool isLast;


  final Widget cardTimeLine;

  const MyTimeLineTitle({
    super.key,
    required this.isFirst,
    required this.isLast,

    required this.cardTimeLine,


  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: LineStyle(color: Colors.black87),
          indicatorStyle:
          IndicatorStyle(
            width: 20,
            color: Colors.black87,
          ),
          endChild: cardTimeLine,
          )
      );

  }
}
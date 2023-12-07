// growth_stages.dart
import 'package:flutter/material.dart';

import '../components/cardTimeLine.dart';
import '../components/timeline.dart';

Widget buildGrowthStages(Map<String, dynamic> jsonData) {
  if (jsonData['growthStages'] != null &&
      jsonData['growthStages'] is List) {
    return Column(
      children: [
        for (var i = 0;
        i < (jsonData['growthStages'] as List).length;
        i++)
          _buildTimeLine(
            jsonData['growthStages'][i],
            i,
            (jsonData['growthStages'] as List).length,
          ),
      ],
    );
  } else {
    return const SizedBox();
  }
}
Widget _buildTimeLine(dynamic stageData, int index, int totalStages) {
  bool isFirstStage = index == 0;
  bool isLastStage = index == totalStages - 1;

  if (stageData != null && stageData is Map<String, dynamic>) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SingleChildScrollView(
        child: MyTimeLineTitle(
          isFirst: isFirstStage,
          isLast: isLastStage,
          cardTimeLine: CardTimeLine(
            stage: stageData['stage'] ?? '',
            date: stageData['date'] ?? '',
            images: (stageData['images'] as List?)?.cast<String>() ?? [],
          ),
        ),
      ),
    );
  } else {
    return const SizedBox();
  }
}

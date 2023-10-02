import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../components/cardTimeLine.dart';
import '../components/timeline.dart';

class QRTree extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const QRTree({super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> jsonData = {};
    try {
      // Phân tích dữ liệu JSON từ chuỗi mã QR
      jsonData = jsonDecode(code);
    } catch (e) {
      // Xử lý lỗi phân tích JSON nếu có
      print('Lỗi phân tích JSON: $e');
    }

    return Scaffold(
      backgroundColor: Color(0xffEFFDF5),
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return RotatedBox(
                quarterTurns: 0,
                child: IconButton(
                  onPressed: () {
                    closeScreen();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: Colors.black54),
                ),
              );
            },
          ),
          centerTitle: true,
          title: const Text(
            "LaLa Farm",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (jsonData.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    height: 370.0,
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        'assets/image/plant/${jsonData['image']}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tên cây: ${jsonData['name'] ?? 'Không có tên'}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff05986A),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Thuộc loại cây : ${jsonData['category'] ?? 'Không có loại'}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text('Lịch sử canh tác:'),
                  if (jsonData['growthStages'] != null &&
                      jsonData['growthStages'] is List)
                    Column(
                      children: [
                        for (var i = 0;
                            i < (jsonData['growthStages'] as List).length;
                            i++)
                          _buildTimeLine(jsonData['growthStages'][i], i, jsonData['growthStages'].length)
                      ],
                    )
                ],
              )
            else
              const Text(
                'Không thể phân tích JSON từ mã QR',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  letterSpacing: 1,
                ),
              ),
          ],
        ),
      ),
    );
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



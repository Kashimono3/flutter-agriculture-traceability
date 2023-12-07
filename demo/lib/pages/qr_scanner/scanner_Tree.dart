import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../components/cardTimeLine.dart';
import '../components/error.dart';
import '../components/timeline.dart';

class QRTree extends StatefulWidget {
  final String code;
  final Function() closeScreen;

  const QRTree({Key? key, required this.closeScreen, required this.code})
      : super(key: key);

  @override
  _QRTreeState createState() => _QRTreeState();
}

class _QRTreeState extends State<QRTree> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, dynamic> jsonData = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    try {
      jsonData = jsonDecode(widget.code);
    } catch (e) {
      print('Lỗi phân tích JSON: $e');
    }
  }

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
                  widget.closeScreen();
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black54),
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (jsonData.isNotEmpty) ...[
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
                          '${jsonData['name'] ?? 'Không có tên'}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff05986A),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '${jsonData['category'] ?? 'Không có loại'}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Vị trí trồng : ${jsonData['location'] ?? 'Không có vị trí'}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TabBar(
                          controller: _tabController,
                          labelColor: Color(0xff54880B),
                          unselectedLabelColor:
                              Color(0xff54880B).withOpacity(0.5),
                          isScrollable: false,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 3,
                              color: Color(0xff54880B),
                            ),
                            insets: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          labelPadding: EdgeInsets.symmetric(horizontal: 20),
                          tabs: [
                            Tab(
                              text: "Quy trình",
                            ),
                            Tab(
                              text: "Vùng trồng",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Color(0xff54880B),
                      unselectedLabelColor: Color(0xff54880B).withOpacity(0.5),
                      isScrollable: false,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xff54880B),
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      tabs: [
                        Tab(
                          text: "Quy trình",
                        ),
                        Tab(
                          text: "Vùng trồng",
                        ),
                      ],
                    ),
                  ),
                  if (jsonData['growthStages'] != null &&
                      jsonData['growthStages'] is List) ...[
                    for (var i = 0;
                        i < (jsonData['growthStages'] as List).length;
                        i++)
                      _buildTimeLine(jsonData['growthStages'][i], i,
                          (jsonData['growthStages'] as List).length)
                  ],
                ],
              ),
            ] else
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ErrorScreen()),
                  );
                },
              ),
          ],
        ),
      ),
    );
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
}

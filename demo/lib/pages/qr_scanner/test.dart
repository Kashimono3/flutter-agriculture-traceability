import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle; // Import rootBundle
import '../../json/tree.dart';


class PlantInfoScreen extends StatelessWidget {
  Future<PlantData> fetchData() async {

    final jsonData = await rootBundle.loadString('assets/filedemo.json'); // Đặt đúng đường dẫn tới tệp JSON trong assets

    final jsonMap = jsonDecode(jsonData);

    return PlantData.fromJson(jsonMap['atiso']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin cây'),
      ),
      body: Center(
        child: FutureBuilder<PlantData>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Lỗi: ${snapshot.error}');
            } else {
              final plantData = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tên cây: ${plantData?.name}'),
                  Text('Danh mục: ${plantData?.category}'),
                  Text('Ngày trồng: ${plantData?.plantingDate}'),
                  Text('Vị trí: ${plantData?.location}'),
                  Text('Giai đoạn phát triển:'),
                  for (var stage in plantData?.growthStages ?? [])
                    ListTile(
                      title: Text(stage.stage),
                      subtitle: Text(stage.description),
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}



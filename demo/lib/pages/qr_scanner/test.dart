import 'dart:convert';
import 'package:demo/pages/qr_scanner/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle; // Import rootBundle
import '../../json/tree.dart';

class PlantInfoScreen extends StatelessWidget {
  Future<PlantData> fetchData() async {
    final jsonData = await rootBundle.loadString(
        'assets/json/filedemo.json'); // Đặt đúng đường dẫn tới tệp JSON trong assets

    final jsonMap = jsonDecode(jsonData);

    return PlantData.fromJson(jsonMap['atiso']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(

          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/logomini.png",
                width:  40,
                height: 40,),
              SizedBox(width: 10,),
              const Text(
                "La Farm",
                style: TextStyle(
                  color: Color(0xff05986A),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),

        leading: Builder(

          builder: (BuildContext context) {

            return RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                onPressed: () {
                  QRScanner();
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: Color(0xff05986A)),
              ),
            );
          },
        ),

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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 370.0,
                      // Set a fixed height to make it square
                      alignment: Alignment.center,
                      // Center the content horizontally and vertically
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/image/plant/${plantData?.image}',
                          fit: BoxFit.cover, // You can adjust the fit as needed
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tên cây: ${plantData?.name}',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff05986A),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Thuộc loại cây : ${plantData?.category}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('Giai đoạn phát triển:'),
                    for (var stage in plantData?.growthStages ?? [])
                      ListTile(
                        title: Text(stage.stage),
                        subtitle: Text(stage.description),
                        leading:
                            Image.asset('assets/image/plant/${stage.image}'),
                      ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

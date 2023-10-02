import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../json/tree.dart';
import '../components/cardTimeLine.dart';
import '../components/timeline.dart';

class PlantInfoScreen extends StatelessWidget {
  Future<PlantData> fetchData() async {
    final jsonData = await rootBundle.loadString('assets/json/filedemo.json');
    print('JSON Data: $jsonData'); // Add this line to check the loaded JSON data
    final jsonMap = jsonDecode(jsonData);
    return PlantData.fromJson(jsonMap);
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
                  // Replace with your desired action on back button press
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: Color(0xff05986A)),
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
              return Text('Error: ${snapshot.error}');
            } else {
              final plantData = snapshot.data;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 370.0,
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/image/plant/${plantData?.image}',
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
                    SizedBox(
                      height: 15,
                    ),
                    Text('Lịch sử phát triển: '),
                    Column(
                      children: [
            if (plantData != null)
              ...plantData.growthStages.asMap().entries.map(
            (entry) => _buildTimeLineElement(
            context,
            entry.value,
            entry.key == 0,
            entry.key == plantData.growthStages.length - 1,

                    )
                    ),],
                ),
              ]));
            }
          },
        ),
      ),
    );
  }
}

Widget _buildTimeLineElement(
    BuildContext context, GrowthStage growthStage,bool isFirst, bool isLast) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: SingleChildScrollView(
      child: MyTimeLineTitle(
        isFirst: isFirst, // Adjust as needed
        isLast: isLast,
        cardTimeLine: CardTimeLine(
          stage: growthStage.stage ?? '',
          date: growthStage.date ?? '',
          images: growthStage.images,
        ),
      ),
    ),
  );
}

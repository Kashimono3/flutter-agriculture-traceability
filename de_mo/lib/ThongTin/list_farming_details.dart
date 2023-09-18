import 'package:flutter/material.dart';
import 'package:de_mo/ThongTin/list_farming_details2.dart';
class Listfarmingdetail extends StatelessWidget {
  List<ImageData> imageDataList = [
      ImageData(
        imagePath: "assets/images/gieotrong.png",
      ),
      ImageData(
        imagePath: "assets/images/gieotrong.png",
      ),
      ImageData(
        imagePath: "assets/images/gieotrong.png",
      ),
      ImageData(
        imagePath: "assets/images/gieotrong.png",
      ),
      ImageData(
        imagePath: "assets/images/gieotrong.png",
      ),
      ImageData(
        imagePath: "assets/images/gieotrong.png",
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
        ),
        children: imageDataList.map((imageData) {
           return GestureDetector(
            onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Listfarmingdetail2(/*imageData.imagePath*/)),
             ); 
          },
          child: Container(
            
            padding: const EdgeInsets.all(8.0),
            child: Column(
               
              children: <Widget>[
                const Text(
                  "Nội dung",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Image.asset(imageData.imagePath),
                const SizedBox(height: 8.0),
              ],
            ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ImageData {
  final String imagePath;
  ImageData({
    required this.imagePath,
  });
}
import 'package:flutter/material.dart';

class CardTimeLine extends StatelessWidget {
  final String stage;
  final String date;
  final List<String> images;

  const CardTimeLine({
    required this.stage,
    required this.date,
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Limit the number of images to a maximum of 3
    List<String> displayedImages = images.take(3).toList();

    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Stage: $stage', textAlign: TextAlign.right),
              Text('Date: $date', textAlign: TextAlign.left),

            ],
          ),
          SizedBox(height: 10), // Add some space between text and images
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: displayedImages.map((image) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                    child: Image.asset(
                      'assets/image/plant/$image',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

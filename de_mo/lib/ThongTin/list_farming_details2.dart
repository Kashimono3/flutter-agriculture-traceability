import 'package:flutter/material.dart';
class Listfarmingdetail2 extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child:Column(
          children: [titleText,  
          Card(
          elevation:3,  
         color: Color(0xFFDBF5ED), 
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), 
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
            
            Expanded(
                  flex: 1, 
                  child :Padding(
                        padding: const EdgeInsets.all(16.0),
                      
                    child : Column(
                    children:<Widget> [
                      
                       leftColumn,],
                ),
                )
            ),
            Expanded(
                  flex: 1, 
                  child :Padding(
                    padding: const EdgeInsets.all(16.0),
                          child : Column(
                        children: [
                        Image.asset(
                          'assets/images/gieotrong3.png',
                          height: 100,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 16), // Khoảng cách giữa hai hình ảnh
                        Image.asset(
                          'assets/images/gieotrong3.png',
                          height: 100,
                          width: 200,
                          fit: BoxFit.cover,

                        ),
                        SizedBox(height: 16),
                        Image.asset(
                          'assets/images/gieotrong3.png',
                          height: 100,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        
                      ],
            ),
            ),
            )
            ],
            
        ),
      ),
       ],
        )
      // #enddocregion body
    );
  }
}

    const titleText = 
      Text(
        'Gieo Trồng',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.black,
          
        ),
    );
    const titleText1 = 
      Text(
        '* Pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
      'topped with fruit and whipped cream.',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.grey,
        ),
    );

    const subTitle = Text(
      '* Pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
      'topped with fruit and whipped cream.',
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );

    final leftColumn = Container(
      child: const Column(
        children:[
          titleText1,
          subTitle,
        ],
      ),
    );
    // #enddocregion leftColumn

    final mainImage = Image.asset(
      'assets/images/gieotrong3.png',
      fit: BoxFit.cover,
    );

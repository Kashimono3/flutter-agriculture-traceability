
import 'package:flutter/material.dart';
import 'package:de_mo/ThongTin/list_farming_details.dart';
class Thongtin extends StatefulWidget {
  const Thongtin({super.key});

  @override
  _ThongtinState createState() => _ThongtinState();
}

class _ThongtinState extends State<Thongtin>
{
  // List<Station> stations = [
  //   Station(1, 'Cây xáo tam phân', 'Theo phân tích, xáo tam '),
  // ];
  // final borderRadius = BorderRadius.circular(20); 
  // Widget post(){
  //   return Scaffold(
  //     body: ListView.builder(
  //         itemCount: stations.length,
  //         itemBuilder: (context, index) {
  //           final item = stations[index];
  //           return Container(
  //               margin: EdgeInsets.symmetric(horizontal: 10.0),
  //               child :Card(
  //                 elevation:3, // Đặt elevation thành 0 để loại bỏ shadow mặc định  
  //                 color: Color(0xFFDBF5ED), 
  //                 child: ListTile(
  //                   leading: Container(
  //                       padding: EdgeInsets.all(3), // Border width
  //                       decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius), 
  //                       child: ClipRRect(
  //                         borderRadius: borderRadius,
  //                         child: SizedBox.fromSize(
  //                           size: Size.fromRadius(26),
  //                           child: Image.asset( 'assets/images/xaotamphan.jpg',fit: BoxFit.cover,),
  //                         ),
  //                       ),
  //                     ),
  //                   title: Text(
  //                     item.name,
  //                     style: TextStyle(color: Color(0xFF05986A)),
  //                   ),
  //                   subtitle: Text(
  //                     item.type,
  //                     style: TextStyle(color: Color(0xFF7C7D7D)),
  //                   ),
  //                 ),
  //               )
  //               );
  //             },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
      length: 2, // Số lượng tab
      child: Scaffold(
        appBar: const TabBar(
          labelColor:  Colors.black,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.label,  
            indicatorColor : Color(0xFF05986A),
            tabs: <Widget>[
              Tab(
                text: 'Vùng trồng',
              ),
              Tab(
                text: 'Quy trình',
              ),
            ],           
        ),
    body:  TabBarView(
          children: <Widget>[
            Listfarmingdetail(),
            Listfarmingdetail(),
          ],
        ),
      
    )
  );
}
}

// class Station {
//   int id;
//   String name;
//   String type;
//   Station(this.id, this.name, this.type);
// }

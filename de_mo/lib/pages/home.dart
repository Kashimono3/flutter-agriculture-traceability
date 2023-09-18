import 'package:flutter/material.dart';
import 'package:de_mo/ThongTin/thong_tin.dart';
import 'package:de_mo/pages/notification.dart';
import 'package:de_mo/pages/qr_scanner.dart';
import 'package:de_mo/pages/register.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home>
{
  int currentTab =0;
  final List<Widget> screen =[
    
    Thongtin() ,
     Inform(),
     QRScanner(),
     Register(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen= const Thongtin();
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Số lượng tab
      child: Scaffold(
        
        appBar: AppBar(
        leading: Builder(
            builder: (BuildContext context) {
              return RotatedBox(quarterTurns: 0, child: IconButton(
                  onPressed:() {
                    Navigator.pop(context);},
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black54),
              ),
              );
            },
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFFFFF),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 36,
                    ),
              ),
              const SizedBox(width: 8),
              const Text(
                'LaFarm',
                style: TextStyle(color: Color(0xFF05986A),  fontWeight: FontWeight.bold), 
              ),
            ],
          ),
          // Plant(),
        ),
       body:  PageStorage(
              child: currentScreen,
              bucket: bucket,
        ),

        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child:Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen= const Thongtin();
                          currentTab = 0;                     
                          });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color:currentTab==0? const Color(0xFF05986A) :Colors.grey,
                          ),
                          Text(
                            'Home',
                            style:TextStyle(color:currentTab == 0 ?const Color(0xFF05986A) :Colors.grey),
                          )
                        ],
                      ),  
                    ),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: (){
                          setState(() {
                            currentScreen= const Inform();
                            currentTab = 1;
                                                  
                            });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bookmark,
                              color:currentTab==1? const Color(0xFF05986A) :Colors.grey,

                            ),
                            Text(
                              'Bookmark',
                              style:TextStyle(color:currentTab == 1 ?const Color(0xFF05986A) :Colors.grey),
                            )
                          ],
                        ),
                      ),
                  ],

                ),
                MaterialButton(
                      shape: const CircleBorder(),
                      onPressed: (){
                        setState(() {
                          currentScreen= const QRScanner();
                          currentTab = 2;                      
                          });
                      },
                      color: const Color(0xFF05986A),
                      child:const Column(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            color:Colors.white,
                          ),
                        ],
                      ),
                    ),
                // floatingActionButton: FloatingActionButton(
                //   child: Icon(Icons.qr_code_scanner) ,backgroundColor: Color(0xFF05986A),
                //   onPressed: () {},
                // ),
                // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen= Inform();
                          currentTab = 3;
                                                
                          });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications,
                            color:currentTab==3? const Color(0xFF05986A) :Colors.grey,
                          ),
                          Text(
                            'Notification',
                            style:TextStyle(color:currentTab == 3?const Color(0xFF05986A) :Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: (){
                          setState(() {
                            currentScreen= Register();
                            currentTab = 4;
                                                  
                            });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              
                              Icons.account_circle,
                              color:currentTab==4? Color(0xFF05986A) :Colors.grey,
                              
                            ),
                            Text(
                              'Account',
                              style:TextStyle(color:currentTab == 4?Color(0xFF05986A) :Colors.grey),
                            )
                          ],
                        ),
                      ),
                  ],

                ),
                
              ],
            ),
          ),
        ),  
    )
    );
  }
}



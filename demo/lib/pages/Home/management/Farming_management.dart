import 'package:demo/pages/Home/management/widgets/items_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Farming_management extends StatefulWidget {
  const Farming_management({super.key});

  @override
  State<Farming_management> createState() => _Farming_managementState();
}

class _Farming_managementState extends State<Farming_management> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState (){
    _tabController = TabController(length: 4, vsync: this,initialIndex: 0);
    _tabController.addListener(_handleTabSeletion);

    super.initState();

  }
  _handleTabSeletion(){
    if(_tabController.indexIsChanging){
        setState(() {

        });
    };
  }
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: [
          ItemsWidget(),
          ItemsWidget(),
          ItemsWidget(),
          ItemsWidget(),
        ][_tabController.index],
      ),
    );
  }
}



import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/pickup_widget.dart';
import 'package:flutter/material.dart';

class PickupStatusScreen extends StatefulWidget {
  @override
  _PickupStatusScreenState createState() => _PickupStatusScreenState();
}

class _PickupStatusScreenState extends State<PickupStatusScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickup Status'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppStyle.primaryColor,
          tabs: const [
            Tab(text: 'Menunggu'),
            Tab(text: 'Diproses'),
            Tab(text: 'Selesai'),
            Tab(text: 'Batal')
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PickupWidget(
            number: 1,
          ),
          PickupWidget(
            number: 2,
          ),
          PickupWidget(
            number: 3,
          ),
          PickupWidget(
            number: 4,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

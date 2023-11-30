import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/pickup_widget.dart';
import 'package:flutter/material.dart';

class ExchangeScreen extends StatefulWidget {
  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen>
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
        title: const Text('Exchange'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppStyle.primaryColor,
          tabs: const [
            Tab(text: 'GoPay'),
            Tab(text: 'OVO'),
            Tab(text: 'ShopeePay'),
            Tab(text: 'Dana')
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

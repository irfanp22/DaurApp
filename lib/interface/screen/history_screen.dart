import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/date_filter_modal.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/transaksi_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaksi {
  final String type;
  final String category;
  final int poin;
  final DateTime date;

  Transaksi({
    required this.type,
    required this.category,
    required this.poin,
    required this.date,
  });
}

class HistoryScreen extends StatefulWidget {
  String selectedOption = "7 hari terakhir";
  DateTime startDate = DateTime.now().subtract(const Duration(days: 6));
  DateTime endDate = DateTime.now();
  HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Transaksi> items = [
    Transaksi(
        type: 'Masuk', category: 'Pick Up', poin: 20000, date: DateTime.now()),
    Transaksi(
        type: 'Keluar',
        category: 'Tukar Poin',
        poin: 10500,
        date: DateTime.now()),
    Transaksi(
        type: 'Masuk',
        category: 'Drop Point',
        poin: 30000,
        date: DateTime.now()),
  ];

  void _handleDateFilterChange(
      String selectedOption, DateTime startDate, DateTime endDate) {
    setState(() {
      widget.selectedOption = selectedOption;
      widget.startDate = startDate;
      widget.endDate = endDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          WhiteSpaceWidget(),
          GreenPatternBackground(half: true),
          Align(
            alignment: const Alignment(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppStyle.defaultPadding,
                vertical: AppStyle.defaultPadding * 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Riwayat Transaksi",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppStyle.textColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height * 0.25) / 2 +
                AppStyle.defaultPadding,
            left: AppStyle.defaultPadding,
            right: AppStyle.defaultPadding,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(AppStyle.defaultPadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Cari Transaksi",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppStyle.primaryColor,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          _showDateRangeSelectionModal(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.calendar,
                                  color: AppStyle.primaryColor,
                                ),
                                const SizedBox(width: 5),
                                Text(widget.selectedOption),
                              ],
                            ),
                            const Icon(CupertinoIcons.chevron_forward,
                                color: AppStyle.primaryColor),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: AppStyle.primaryColor,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Dari ${DateFormat('dd/MM/yyyy').format(widget.startDate)} sampai ${DateFormat('dd/MM/yyyy').format(widget.endDate)}",
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height * 0.25) + 25,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return TransaksiWidget(
                      context: context, index: index, items: items);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDateRangeSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DateFilterModal(
            selectedOption: widget.selectedOption,
            startDate: widget.startDate,
            endDate: widget.endDate,
            onOptionChanged: _handleDateFilterChange);
      },
    );
  }
}

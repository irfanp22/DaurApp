import 'package:daur_app/data/datastore/user_datastore.dart';
import 'package:daur_app/interface/stateholders/history_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/date_filter_modal.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/transaksi_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final _hist = Get.find<HistoryController>();
final _usr = UserDatastore();

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  void _handleDateFilterChange(
      String selectedOption, DateTime startDate, DateTime endDate) {
    _hist.selectedOption.value = selectedOption;
    _hist.startDate = startDate;
    _hist.endDate = endDate;
    _hist.update();
    _usr.getHistory(startDate, endDate);
  }

  void showDateRangeSelectionModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DateFilterModal(
            selectedOption: _hist.selectedOption.value,
            startDate: _hist.startDate,
            endDate: _hist.endDate,
            onOptionChanged: _handleDateFilterChange);
      },
    );
  }

  @override
  void initState() {
    _usr.getHistory(_hist.startDate, _hist.endDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (controller) {
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
                            showDateRangeSelectionModal(context);
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
                                  Text(controller.selectedOption.value),
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
                              "Dari ${DateFormat('dd/MM/yyyy').format(controller.startDate)} sampai ${DateFormat('dd/MM/yyyy').format(controller.endDate)}",
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
                  child: Obx(
                    () => ListView.builder(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      itemCount: controller.history.length,
                      itemBuilder: (context, index) {
                        return TransaksiWidget(
                            context: context,
                            index: index,
                            items: controller.history);
                      },
                    ),
                  )),
            ),
          ],
        ),
      );
    });
  }
}

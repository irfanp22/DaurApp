import 'package:daur_app/data/datastore/user_datastore.dart';
import 'package:daur_app/interface/stateholders/trash_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/trash_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _data = UserDatastore();

class TrashScreen extends StatefulWidget {
  const TrashScreen({Key? key}) : super(key: key);

  @override
  _TrashScreenState createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  void initState() {
    _data.getTong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrashController>(builder: (controller) {
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
                        "Tong Sampah",
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
              top: (MediaQuery.of(context).size.height * 0.25) / 2,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                  color: Colors.transparent,
                  child: Obx(
                    () => ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      itemCount: controller.trashList.length,
                      itemBuilder: (context, index) {
                        final items = controller.trashList[index];
                        return ListTile(
                          title: Row(
                            children: [
                              Image.network(
                                items['pic'],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items['name'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppStyle.headTextColor,
                                        ),
                                  ),
                                  Text(
                                    items['category'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38,
                                        ),
                                  ),
                                  Text(
                                    '${items['price'].toString()} Poin /Kg',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppStyle.primaryColor,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _data.removeTong(items);
                            },
                          ),
                        );
                      },
                    ),
                  )),
            ),
            Obx(() => (controller.trashList.isNotEmpty)
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SummaryWidget(
                      items: controller.trashList,
                    ),
                  )
                : const SizedBox())
          ],
        ),
      );
    });
  }
}

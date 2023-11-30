import 'package:daur_app/data/datastore/constant_datastore.dart';
import 'package:daur_app/interface/stateholders/drop_point_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DropPointScreen extends StatefulWidget {
  const DropPointScreen({Key? key}) : super(key: key);

  @override
  State<DropPointScreen> createState() => _DropPointScreenState();
}

class _DropPointScreenState extends State<DropPointScreen> {
  final _data = ConstantDatastore();
  final _drop = Get.find<DropPointController>();
  @override
  void initState() {
    _data.getDropPoint();
    ever(_drop.dropPoint, (_) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropPointController>(builder: (controller) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Drop Point'),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              WhiteSpaceWidget(),
              GreenPatternBackground(oth: true),
              Align(
                alignment: const Alignment(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppStyle.defaultPadding,
                    vertical: AppStyle.defaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "Drop Point di Sekitar",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppStyle.textColor),
                        ),
                      ),
                      const SizedBox(
                        height: AppStyle.defaultPadding * 2,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _drop.dropPoint.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: ListTile(
                                title: Text(_drop.dropPoint[index]['name']),
                                subtitle: Text(_drop.dropPoint[index]['kode']),
                                trailing: const Icon(Icons.location_pin),
                              ),
                              onTap: () async {
                                final double latitude =
                                    _drop.dropPoint[index]['latitude'];
                                final double longitude =
                                    _drop.dropPoint[index]['longitude'];

                                final uri =
                                    'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

                                if (await canLaunchUrlString(uri)) {
                                  await launchUrlString(uri);
                                } else {
                                  print('Could not launch $uri');
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
    });
  }

  @override
  void dispose() {
    _drop.dropPoint = [].obs;
    super.dispose();
  }
}

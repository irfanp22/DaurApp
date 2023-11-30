import 'package:daur_app/data/datastore/user_datastore.dart';
import 'package:daur_app/data/model/constant.dart';
import 'package:daur_app/interface/screen/catalog_screen.dart';
import 'package:daur_app/interface/screen/daur_hero_screen.dart';
import 'package:daur_app/interface/screen/drop_point_screen.dart';
import 'package:daur_app/interface/screen/exchange_screen.dart';
import 'package:daur_app/interface/screen/input_screen.dart';
import 'package:daur_app/interface/screen/pickup_status_screen.dart';
import 'package:daur_app/interface/stateholders/daur_hero_controller.dart';
import 'package:daur_app/interface/stateholders/history_controller.dart';
import 'package:daur_app/interface/stateholders/home_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/spacer_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final c = Get.find<HomeController>();
  final h = Get.find<HistoryController>();
  final l = Get.find<DaurHeroController>();
  final data = UserDatastore();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      await c.setUserData();
      await l.setDaurHeroStream(firestore.collection('daurHero').snapshots());
      l.choose(c.usr!.xp);
      await data.getHistory(
        DateTime.now().subtract(const Duration(days: 89)),
        DateTime.now(),
      );

      if (h.history.isNotEmpty) {
        c.expenses.value = 0;
        c.incomes.value = 0;
        for (final hist in h.history) {
          (hist['type'] == 'Masuk')
              ? c.incomes.value += hist['poin']
              : c.expenses.value += hist['poin'];
        }
      }
    } catch (e) {
      print("Error loading data: $e");
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: [
              WhiteSpaceWidget(),
              GreenPatternBackground(),
              Align(
                alignment: const Alignment(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppStyle.defaultPadding,
                    vertical: AppStyle.defaultPadding * 4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SvgPicture.asset("assets/icons/avatar.svg"),
                          ),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(children: [
                                Text(
                                  "Selamat Datang",
                                  style: TextStyle(color: AppStyle.textColor),
                                ),
                              ]),
                              const SizedBox(height: AppStyle.defaultPadding),
                              if (controller.usr != null)
                                Text(
                                  controller.usr!.namaLengkap!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppStyle.textColor),
                                ),
                              if (controller.usr == null)
                                const Text(
                                  "Loading...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppStyle.textColor),
                                ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: AppStyle.defaultPadding,
                right: AppStyle.defaultPadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                      decoration: AppStyle.buildGradientDecoration(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white, width: 2.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppStyle.defaultPadding),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: AppStyle.defaultPadding),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/poin.svg",
                                      width: 40,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "DaurPoin",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppStyle.textColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppStyle.defaultPadding),
                                Row(children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Active DaurPoin",
                                        style: TextStyle(
                                            color: AppStyle.textColor),
                                      ),
                                      if (controller.usr != null)
                                        Text(
                                          controller.usr!.activePoin!
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppStyle.textColor),
                                        ),
                                      if (controller.usr == null)
                                        Text(
                                          'Loading....',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppStyle.textColor),
                                        )
                                    ],
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.to(() => ExchangeScreen());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      side: const BorderSide(
                                          color: Colors.white, width: 1),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .arrow_2_circlepath_circle,
                                            size: 40,
                                          ),
                                          SizedBox(width: 4),
                                          Text("Exchange"),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                                SpacerWidget(login: false, color: Colors.white),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            CupertinoIcons.arrow_down_circle,
                                            color: AppStyle.textColor,
                                            size: 40,
                                          ),
                                          const SizedBox(width: 4),
                                          Column(
                                            children: [
                                              const Text(
                                                "Incomes",
                                                style: TextStyle(
                                                    color: AppStyle.textColor),
                                              ),
                                              Text(
                                                c.incomes.value.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppStyle.textColor),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            CupertinoIcons.arrow_up_circle,
                                            color: AppStyle.textColor,
                                            size: 40,
                                          ),
                                          const SizedBox(width: 4),
                                          Column(
                                            children: [
                                              const Text(
                                                "Expenses",
                                                style: TextStyle(
                                                    color: AppStyle.textColor),
                                              ),
                                              Text(
                                                c.expenses.value.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppStyle.textColor),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppStyle.defaultPadding),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4 + 75,
                left: AppStyle.defaultPadding,
                right: AppStyle.defaultPadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppStyle.buildMenuItem(
                                  CupertinoIcons.doc_fill, "Catalog", () {
                                Get.to(() => CatalogScreen());
                              }),
                              AppStyle.buildMenuItem(
                                  Icons.location_pin, "Drop Point", () {
                                Get.to(() => const DropPointScreen());
                              }),
                              AppStyle.buildMenuItem(
                                  CupertinoIcons.car_fill, "Pick Up", () {
                                Get.to(() => PickupStatusScreen());
                              }),
                              AppStyle.buildMenuItem(
                                  CupertinoIcons.qrcode, "Input Poin", () {
                                Get.to(const InputScreen());
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.6 + 15,
                left: AppStyle.defaultPadding,
                right: AppStyle.defaultPadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => DaurHeroScreen());
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppStyle.defaultPadding,
                        vertical: AppStyle.defaultPadding,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          CupertinoIcons.star_circle_fill,
                          size: 40,
                          color: AppStyle.primaryColor,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${(l.nextHero?['xp'] ?? 0) - (controller.usr?.xp ?? 0)} xp lagi menuju ${l.nextHero?['name'] ?? ''}",
                                style: const TextStyle(
                                  color: AppStyle.headTextColor,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              if (controller.usr != null && l.nextHero != null)
                                LinearProgressIndicator(
                                  value: (controller.usr!.xp ?? 0) /
                                      (l.nextHero!['xp'] ?? 1),
                                ),
                            ],
                          ),
                        ),
                        const Icon(
                          CupertinoIcons.chevron_right,
                          size: 40,
                          color: AppStyle.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}

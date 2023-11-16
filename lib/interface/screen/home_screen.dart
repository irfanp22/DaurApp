import 'package:daur_app/data/model/news_model.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/news_list_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const WhiteSpaceWidget(),
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
                            Text(
                              "User",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Active DaurPoin",
                                      style:
                                          TextStyle(color: AppStyle.textColor),
                                    ),
                                    Text(
                                      "2000",
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
                                    // Add your exchange button logic here
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
                              const SizedBox(height: AppStyle.defaultPadding),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: AppStyle.textColor,
                              ),
                              const SizedBox(height: AppStyle.defaultPadding),
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
                                              "6500",
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
                                              "4500",
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
                                CupertinoIcons.doc_fill, "Catalog", () {}),
                            AppStyle.buildMenuItem(
                                Icons.location_pin, "Drop Point", () {}),
                            AppStyle.buildMenuItem(
                                CupertinoIcons.car_fill, "Pick Up", () {}),
                            AppStyle.buildMenuItem(
                                CupertinoIcons.rectangle_grid_2x2_fill,
                                "More",
                                () {}),
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
                    // Your button logic here
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppStyle.defaultPadding,
                      vertical: AppStyle.defaultPadding,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        CupertinoIcons.gift_fill,
                        size: 40,
                        color: AppStyle.primaryColor,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("90 xp lagi menuju Pelopor Lingkungan",
                                style:
                                    TextStyle(color: AppStyle.headTextColor)),
                            SizedBox(
                              height: 8,
                            ),
                            LinearProgressIndicator(
                              value: 110 / 200,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        CupertinoIcons.chevron_right,
                        size: 40,
                        color: AppStyle.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7 + 10,
              left: AppStyle.defaultPadding,
              right: AppStyle.defaultPadding,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppStyle.defaultPadding,
                      vertical: AppStyle.defaultPadding,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.news_solid,
                              size: 40,
                              color: AppStyle.primaryColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "DaurNews",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppStyle.headTextColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 200,
                          child: NewsListItem(
                            newsItem: NewsItem(
                              title: "Breaking News",
                              date: DateTime.now(),
                              preview:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 200,
                          child: NewsListItem(
                            newsItem: NewsItem(
                              title: "Breaking News",
                              date: DateTime.now(),
                              preview:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

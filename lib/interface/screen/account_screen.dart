import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/setting_widget.dart';
import 'package:daur_app/interface/widget/spacer_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Akun",
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
              top: MediaQuery.of(context).size.height * 0.12,
              left: AppStyle.defaultPadding,
              right: AppStyle.defaultPadding,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                    decoration:
                        const BoxDecoration(color: AppStyle.backgroundColor),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            color: AppStyle.headTextColor, width: 2.0),
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: SvgPicture.asset(
                                        "assets/icons/avatar.svg"),
                                  ),
                                  const SizedBox(
                                      width: AppStyle.defaultPadding),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "User",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppStyle.headTextColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: AppStyle.defaultPadding),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: AppStyle.headTextColor,
                                      width: 2.0),
                                ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          CupertinoIcons.gift_fill,
                                          size: 40,
                                          color: AppStyle.primaryColor,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text("Pelopor Lingkungan",
                                                  style: TextStyle(
                                                      color: AppStyle
                                                          .headTextColor)),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text("Member sejak Jan 2023")
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
                              SpacerWidget(
                                  login: false, color: AppStyle.headTextColor),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          CupertinoIcons.checkmark_seal,
                                          color: AppStyle.headTextColor,
                                          size: 40,
                                        ),
                                        const SizedBox(width: 4),
                                        Column(
                                          children: [
                                            const Text(
                                              "Incomes",
                                              style: TextStyle(
                                                  color:
                                                      AppStyle.headTextColor),
                                            ),
                                            Text(
                                              "6500",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppStyle
                                                          .headTextColor),
                                            )
                                          ],
                                        ),
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
                top: MediaQuery.of(context).size.height * 0.45,
                left: AppStyle.defaultPadding,
                right: AppStyle.defaultPadding,
                child: Column(
                  children: [
                    SettingWidget(
                      icon: CupertinoIcons.gift_fill,
                      text: "Button 1",
                      progressValue: 110 / 200,
                      onPressed: () {
                        // Your button logic here
                      },
                    ),
                    const SizedBox(height: 5),
                    SettingWidget(
                      icon: CupertinoIcons.gift_fill,
                      text: "Button 1",
                      progressValue: 110 / 200,
                      onPressed: () {
                        // Your button logic here
                      },
                    ),
                    const SizedBox(height: 5),
                    SettingWidget(
                      icon: CupertinoIcons.gift_fill,
                      text: "Button 1",
                      progressValue: 110 / 200,
                      onPressed: () {
                        // Your button logic here
                      },
                    ),
                    const SizedBox(height: 5),
                    SettingWidget(
                      icon: CupertinoIcons.gift_fill,
                      text: "Button 1",
                      progressValue: 110 / 200,
                      onPressed: () {
                        // Your button logic here
                      },
                    ),
                  ],
                )),
          ],
        ));
  }
}

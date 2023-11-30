import 'package:daur_app/interface/screen/about_screen.dart';
import 'package:daur_app/interface/screen/change_pass_screen.dart';
import 'package:daur_app/interface/screen/daur_hero_screen.dart';
import 'package:daur_app/interface/screen/profile_screnn.dart';
import 'package:daur_app/interface/screen/tnd_screen.dart';
import 'package:daur_app/interface/stateholders/account_controller.dart';
import 'package:daur_app/interface/stateholders/home_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/setting_widget.dart';
import 'package:daur_app/interface/widget/spacer_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (controller) {
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
                                          user.usr!.namaLengkap!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppStyle.headTextColor),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.star_circle_fill,
                                            size: 40,
                                            color: AppStyle.primaryColor,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const Text("Green Saver",
                                                    style: TextStyle(
                                                        color: AppStyle
                                                            .headTextColor)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    "Member sejak ${DateFormat.yMMM().format(user.usr!.createdAt!.toDate())}")
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
                                SpacerWidget(
                                    login: false,
                                    color: AppStyle.headTextColor),
                                SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          CupertinoIcons.checkmark_seal,
                                          color: AppStyle.headTextColor,
                                          size: 40,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Bonus Poin",
                                                      style: TextStyle(
                                                          color: AppStyle
                                                              .headTextColor),
                                                    ),
                                                    Text(
                                                      "3%",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppStyle
                                                                .headTextColor,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Diskon Tukar Poin",
                                                      style: TextStyle(
                                                          color: AppStyle
                                                              .headTextColor),
                                                    ),
                                                    Text(
                                                      "3%",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppStyle
                                                                .headTextColor,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
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
                        icon: CupertinoIcons.person_fill,
                        text: "Pengaturan Profil",
                        onPressed: () {
                          Get.to(const ProfileScrenn());
                        },
                      ),
                      const SizedBox(height: 5),
                      SettingWidget(
                        icon: CupertinoIcons.gear_alt_fill,
                        text: "Pengaturan Keamanan",
                        onPressed: () {
                          Get.to(const ChangePassScreen());
                        },
                      ),
                      const SizedBox(height: 5),
                      SettingWidget(
                        icon: CupertinoIcons.info_circle_fill,
                        text: "Tentang Kami",
                        onPressed: () {
                          Get.to(const AboutScreen());
                        },
                      ),
                      const SizedBox(height: 5),
                      SettingWidget(
                        icon: CupertinoIcons.doc_fill,
                        text: "Syarat dan Ketentuan",
                        onPressed: () {
                          Get.to(const TndScreen());
                        },
                      ),
                    ],
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.85,
                left: AppStyle.defaultPadding,
                right: AppStyle.defaultPadding,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Konfirmasi Logout'),
                          content:
                              const Text('Apakah anda yakin ingin keluar?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.logout();
                                navIndex.currentSelectedIndex = 0;
                                Navigator.pop(context);
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                        color: AppStyle.primaryColor, width: 2),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 16, color: AppStyle.headTextColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ));
    });
  }
}

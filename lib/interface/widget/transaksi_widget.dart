import 'package:daur_app/interface/screen/history_screen.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransaksiWidget extends StatelessWidget {
  BuildContext context;
  int index;
  List<Transaksi> items;

  TransaksiWidget(
      {Key? key,
      required this.context,
      required this.index,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              Text(
                DateFormat('dd MMM y HH:mm:ss').format(items[index].date),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold, color: AppStyle.headTextColor),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border:
                            Border.all(color: AppStyle.primaryColor, width: 2)),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            AppStyle.primaryGradient,
                            AppStyle.secondaryGradient
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: Center(
                          child: Icon(
                              items[index].category == "Pick Up"
                                  ? CupertinoIcons.car_fill
                                  : items[index].category == "Drop Point"
                                      ? Icons.location_pin
                                      : CupertinoIcons
                                          .arrow_2_circlepath_circle_fill,
                              size: 40,
                              color: AppStyle.textColor)),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  if (items[index].type == "Masuk") ...[
                                    AppStyle.primaryGradient,
                                    AppStyle.secondaryGradient,
                                  ] else ...[
                                    AppStyle.redColor,
                                    AppStyle.redSecondary,
                                  ],
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  items[index].type == "Masuk"
                                      ? CupertinoIcons.arrow_down
                                      : CupertinoIcons.arrow_up,
                                  size: 20,
                                  color: AppStyle.textColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            items[index].type,
                            style: TextStyle(
                              color: items[index].type == "Masuk"
                                  ? AppStyle.primaryColor
                                  : AppStyle.redColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        items[index].category,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppStyle.headTextColor),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${items[index].type == "Masuk" ? "+" : "-"}${items[index].poin} DaurPoin',
                    style: TextStyle(
                      color: items[index].type == "Masuk"
                          ? AppStyle.primaryColor
                          : AppStyle.redColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: AppStyle.defaultPadding),
          Container(
            height: 1,
            width: double.infinity,
            color: AppStyle.primaryColor,
          ),
        ],
      ),
    );
  }
}

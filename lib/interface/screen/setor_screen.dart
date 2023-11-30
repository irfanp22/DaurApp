import 'package:daur_app/interface/stateholders/trash_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/setor_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetorScreen extends StatefulWidget {
  SetorScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SetorScreen> createState() => _SetorScreenState();
}

class _SetorScreenState extends State<SetorScreen> {
  final _trash = Get.find<TrashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Setor Sampah'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              0, AppStyle.defaultPadding, 0, AppStyle.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SetorWidget(
                title: 'Alamat Penjemputan',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rumah",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jl. Contoh No. 123, Jakarta',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppStyle.defaultPadding),
              SetorWidget(
                title: 'Barang',
                content: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _trash.trashList.length,
                  itemBuilder: (context, index) {
                    final items = _trash.trashList[index];
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
                          setState(() {
                            // items.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: AppStyle.defaultPadding),
              SetorWidget(
                title: 'Foto Barang',
                content: Column(
                  children: [
                    Text('Content for Foto Barang'),
                    // You can add more widgets here as needed
                  ],
                ),
              ),
              SizedBox(height: AppStyle.defaultPadding),
              SetorWidget(
                title: 'Jadwal Penjemputan',
                content: Column(
                  children: [
                    Text('Content for Jadwal Penjemputan'),
                    // You can add more widgets here as needed
                  ],
                ),
              ),
              SizedBox(height: AppStyle.defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

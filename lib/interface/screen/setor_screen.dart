import 'package:daur_app/interface/screen/alamat_screen.dart';
import 'package:daur_app/interface/screen/trash_screen.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/setor_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetorScreen extends StatefulWidget {
  List<TrashItem> items;
  SetorScreen({Key? key, required this.items}) : super(key: key);

  @override
  State<SetorScreen> createState() => _SetorScreenState();
}

class _SetorScreenState extends State<SetorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Setor Sampah'),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
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
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: widget.items[index].isSelected,
                        onChanged: (value) {
                          setState(() {
                            widget.items[index].isSelected = value!;
                          });
                        },
                      ),
                      title: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                            width: MediaQuery.of(context).size.width -
                                120, // Adjust the width as needed
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title: ${widget.items[index].title}'),
                                Text(
                                    'Category: ${widget.items[index].category}'),
                                Text(
                                  'Price: \$${widget.items[index].price.toStringAsFixed(2)}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            widget.items.removeAt(index);
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

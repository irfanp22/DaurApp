import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFilterModal extends StatefulWidget {
  String selectedOption;
  DateTime startDate;
  DateTime endDate;
  final Function(String, DateTime, DateTime) onOptionChanged;

  DateFilterModal(
      {Key? key,
      required this.selectedOption,
      required this.startDate,
      required this.endDate,
      required this.onOptionChanged})
      : super(key: key);

  @override
  _DateFilterModalState createState() => _DateFilterModalState();
}

class _DateFilterModalState extends State<DateFilterModal> {
  @override
  void initState() {
    checkDate();
    super.initState();
  }

  List<DateTime> startDate = [
    DateTime.now().subtract(const Duration(days: 6)),
    DateTime.now().subtract(const Duration(days: 29)),
    DateTime.now().subtract(const Duration(days: 89))
  ];
  DateTime endDate = DateTime.now();

  DateTime aturTanggalStartDate = DateTime.now().subtract(Duration(days: 6));
  DateTime aturTanggalEndDate = DateTime.now();

  void checkDate() {
    if (widget.selectedOption == "Atur tanggal") {
      aturTanggalStartDate = widget.startDate;
      aturTanggalEndDate = widget.endDate;
    }
  }

  Future<void> _selectDate(
      BuildContext context, String label, int index) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate[index],
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != startDate[index]) {
      setState(() {
        startDate[index] = pickedDate;
        widget.selectedOption = 'Atur tanggal';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pilih Rentang Waktu',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppStyle.defaultPadding),
          ListTile(
            title: const Text('7 hari terakhir'),
            subtitle: Text(
              'Dari ${DateFormat('dd/MM/yyyy').format(startDate[0])} sampai ${DateFormat('dd/MM/yyyy').format(endDate)}',
            ),
            leading: Radio(
              value: '7 hari terakhir',
              groupValue: widget.selectedOption,
              onChanged: (value) {
                setState(() {
                  widget.selectedOption = value.toString();
                  widget.startDate = startDate[0];
                  widget.endDate = endDate;
                });
              },
            ),
            onTap: () {
              setState(() {
                widget.selectedOption = '7 hari terakhir';
                widget.startDate = startDate[0];
                widget.endDate = endDate;
              });
            },
          ),
          ListTile(
            title: const Text('30 hari terakhir'),
            subtitle: Text(
              'Dari ${DateFormat('dd/MM/yyyy').format(startDate[1])} sampai ${DateFormat('dd/MM/yyyy').format(endDate)}',
            ),
            leading: Radio(
              value: '30 hari terakhir',
              groupValue: widget.selectedOption,
              onChanged: (value) {
                setState(() {
                  widget.selectedOption = value.toString();
                  widget.startDate = startDate[1];
                  widget.endDate = endDate;
                });
              },
            ),
            onTap: () {
              setState(() {
                widget.selectedOption = '30 hari terakhir';
                widget.startDate = startDate[1];
                widget.endDate = endDate;
              });
            },
          ),
          ListTile(
            title: const Text('90 hari terakhir'),
            subtitle: Text(
              'Dari ${DateFormat('dd/MM/yyyy').format(startDate[2])} sampai ${DateFormat('dd/MM/yyyy').format(endDate)}',
            ),
            leading: Radio(
              value: '90 hari terakhir',
              groupValue: widget.selectedOption,
              onChanged: (value) {
                setState(() {
                  widget.selectedOption = value.toString();
                  widget.startDate = startDate[2];
                  widget.endDate = endDate;
                });
              },
            ),
            onTap: () {
              setState(() {
                widget.selectedOption = '90 hari terakhir';
                widget.startDate = startDate[2];
                widget.endDate = endDate;
              });
            },
          ),
          ListTile(
            title: const Text('Atur tanggal'),
            subtitle: Text(
              'Dari ${DateFormat('dd/MM/yyyy').format(aturTanggalStartDate)} sampai ${DateFormat('dd/MM/yyyy').format(aturTanggalEndDate)}',
            ),
            leading: Radio(
              value: 'Atur tanggal',
              groupValue: widget.selectedOption,
              onChanged: (value) {
                setState(() {
                  widget.selectedOption = value.toString();
                  widget.startDate = aturTanggalStartDate;
                  widget.endDate = aturTanggalEndDate;
                });
              },
            ),
            onTap: () {
              _showDateRangePicker(context);
            },
          ),
          const SizedBox(height: AppStyle.defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.onOptionChanged(
                      widget.selectedOption, widget.startDate, widget.endDate);
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Terapkan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showDateRangePicker(BuildContext context) async {
    DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: aturTanggalStartDate,
        end: aturTanggalEndDate,
      ),
    );

    if (pickedRange != null &&
        pickedRange !=
            DateTimeRange(
                start: aturTanggalStartDate, end: aturTanggalEndDate)) {
      setState(() {
        aturTanggalStartDate = pickedRange.start;
        aturTanggalEndDate = pickedRange.end;
        widget.selectedOption = 'Atur tanggal';
        widget.startDate = aturTanggalStartDate;
        widget.endDate = aturTanggalEndDate;
      });
    }
  }
}

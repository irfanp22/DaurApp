import 'package:get/get.dart';

class HistoryController extends GetxController {
  RxString selectedOption = "7 hari terakhir".obs;
  DateTime startDate = DateTime.now().subtract(const Duration(days: 6));
  DateTime endDate = DateTime.now();
  RxList<Map<String, dynamic>> history = RxList<Map<String, dynamic>>();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/scheduler.dart'; // Import SchedulerBinding to use TickerProvider

class ChatController extends GetxController {
  var currentTab = 0.obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: Get.find<TickerProvider>());
  }

  void changeTab(int index) {
    currentTab.value = index;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

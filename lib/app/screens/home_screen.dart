import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Obx(() {
        switch (controller.currentTab.value) {
          case 0:
            return Center(child: Text("Home"));
          case 1:
            return Center(
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.chat),
                child: Text("Go to Chat"),
              ),
            );

          case 2:
            return Center(
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.stall),
                child: Text("Go to Stall"),
              ),
            );

          default:
            return Center(child: Text("Home"));
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentTab.value,
          onTap: controller.changeTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: "Stall"),
          ],
        );
      }),
    );
  }
}

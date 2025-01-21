import 'package:firebase_connection/app/screens/stall_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../routes/app_routes.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() =>
      _HomeScreenState(); // Corrected the class name here
}

class _HomeScreenState extends State<HomeScreen> {
  // Extending State<HomeScreen> here
  final HomeController controller = Get.find<HomeController>();
  void _onItemTapped(int index) {
    setState(() {
      controller.currentTab.value = index;
      print("controller.currentTab.value => ${controller.currentTab.value}");
    });
  }

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
              child: ChatScreen(),
              // child: ElevatedButton(
              //   onPressed: () => Get.toNamed(AppRoutes.chat),
              //   child: Text("Go to Chat"),
              // ),
            );
          case 2:
            return Center(
              child: StallScreen(),
              // child: ElevatedButton(
              //   onPressed: () => Get.toNamed(AppRoutes.stall),
              //   child: Text("Go to Stall"),
              // ),
            );

          default:
            return Center(child: Text("Home"));
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentTab.value,
          // onTap: controller.changeTab,
          onTap: _onItemTapped,
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

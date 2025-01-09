import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Chat", icon: Icon(Icons.chat)),
            Tab(text: "Friend Requests", icon: Icon(Icons.person_add)),
            Tab(text: "Calls", icon: Icon(Icons.call)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("Chat Tab")),
          Center(child: Text("Friend Requests")),
          Center(child: Text("Call Logs")),
        ],
      ),
    );
  }
}

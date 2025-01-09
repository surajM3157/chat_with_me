import 'package:get/get.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/registration_Screen.dart';
import '../screens/stall_screen.dart';
import '../bindings/home_binding.dart';
import '../bindings/chat_binding.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const chat = '/chat';
  static const stall = '/stall';
  static const signin = '/signin';

  static final pages = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: home, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: chat, page: () => ChatScreen(), binding: ChatBinding()),
    GetPage(name: stall, page: () => StallScreen()),
    GetPage(name: signin, page: () => RegistrationScreen())
  ];
}

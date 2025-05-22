import 'package:aam_app/app/modules/agent/views/agent_view.dart';
import 'package:aam_app/app/modules/home/views/home_view.dart';
import 'package:aam_app/app/modules/login/bindings/login_binding.dart';
import 'package:aam_app/app/modules/login/views/login_view.dart';
import 'package:aam_app/app/modules/notifications/views/notification_view.dart';
import 'package:get/get.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const MAIN = Routes.MAIN;
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: MainBinding()),

    GetPage(
      name: _Paths.AGENT,
      page: () => AgentView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: MainBinding(),
    ),
  ];
}

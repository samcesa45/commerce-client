import 'package:get/get.dart';
import 'package:gx_tutorial/screens/home_screen.dart';
import 'package:gx_tutorial/users/authentication/forgot_password.dart';
import 'package:gx_tutorial/users/authentication/login.dart';
import 'package:gx_tutorial/users/authentication/signup.dart';
import 'package:gx_tutorial/users/authentication/otp_screen.dart';
import 'package:gx_tutorial/users/authentication/reset_password_screen.dart';

abstract class AppRoutes {
  static const HOME_SCREEN = '/home';
  static const LOGIN_SCREEN = '/login';
  static const REGISTER_SCREEN = '/signup';
  static const FORGOT_PASSWORD_SCREEN = '/forgot-password';
  static const OTP_SCREEN = '/otp';
  static const RESET_PASSWORD_SCREEN = '/reset-password';

  static final routes = [
    GetPage(
      name: HOME_SCREEN,
      page: () => const HomeScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: LOGIN_SCREEN,
      page: () => const Login(),
      transition: Transition.fade,
    ),
    GetPage(
      name: REGISTER_SCREEN,
      page: () => const Signup(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: FORGOT_PASSWORD_SCREEN,
      page: () => const ForgotPassword(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: OTP_SCREEN,
      page: () => const OtpScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RESET_PASSWORD_SCREEN,
      page: () => const ResetPasswordScreen(),
      transition: Transition.downToUp,
    ),
  ];
}

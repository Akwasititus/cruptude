import 'package:cryptude/screens/sharePref/shareP.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cryptude/screens/settings_house/change_password.dart';
import 'package:cryptude/screens/login_screen/login.dart';
import 'package:cryptude/screens/introduction_screens/onbording_screen.dart';
import 'package:cryptude/screens/login_screen/register.dart';
import 'package:cryptude/screens/chatbox/mainchat.dart';
import 'package:cryptude/screens/notification_arena/notification_body.dart';
import 'package:cryptude/screens/recovery/otp.dart';
import 'package:cryptude/screens/recovery/recovery_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/landing_page/home_screen.dart';

Future main() async {
  // Initializing SharedPreference
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(const OurApp());
}

class OurApp extends StatefulWidget {
  const OurApp({Key? key}) : super(key: key);

  @override
  State<OurApp> createState() => _OurAppState();
}

class _OurAppState extends State<OurApp> {
  late bool isAuthenticated;

  @override
  void initState() {
    super.initState();
    isAuthenticated = Constants.prefs?.getBool("loggedIn") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
        title: 'Flutter Demo',
        builder: EasyLoading.init(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: [
          GetPage(
              name: '/introductionScreen',
              page: () => const IntroductionScreen()),
          GetPage(name: '/registerScreen', page: () => const RegisterScreen()),
          GetPage(name: '/login', page: () => Login()),
          GetPage(name: '/homeScreen', page: () => HomeScreen()),
          // GetPage(name: '/sellCryptoConfirm', page: () => SellCryptoConfirm(amountEnteredByUser:_controller.text,)),

          GetPage(name: '/mainChat', page: () => const MainChat()),
          GetPage(name: '/editProfile', page: () => const ChangePassword()),
          // GetPage(name: '/enterOTP', page: () => EnterOTP()),
          GetPage(name: '/recoveryEmail', page: () => const RecoveryEmail()),
          //GetPage(name: '/sellCryptoDone', page: () => SellCryptoDone()),
          GetPage(name: '/enterOTP', page: () => EnterOTP()),
          GetPage(
              name: '/notificationArena', page: () => const NotificationBody()),
        ],
        initialRoute: isAuthenticated ? '/homeScreen' : '/login'
        // home: SellCrypto(),
        );
  }
}

import 'package:zen_health/provider/provider_age.dart';
import 'package:zen_health/provider/provider_height.dart';
import 'package:zen_health/provider/provider_male_female.dart';
import 'package:zen_health/provider/provider_weight.dart';
import 'package:zen_health/screens/splash_screen.dart';
import 'package:zen_health/widget/mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zen_health/constants/color_constants.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderMaleFemale()),
        ChangeNotifierProvider(create: (context) => ProviderHeight()),
        ChangeNotifierProvider(create: (context) => ProviderWeight()),
        ChangeNotifierProvider(create: (context) => ProviderAge()),
      ],
      child:const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      builder: (context, child) => Mobile(child: child!),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.lightGreen,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark, // Android
            statusBarBrightness: Brightness.light, // iOS
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          shape: CircleBorder(),
          smallSizeConstraints: BoxConstraints.tightFor(width: 40, height: 40, ),
          backgroundColor: Colors.white, // Default FAB color
          // foregroundColor: Colors.white,  // Default icon color
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}


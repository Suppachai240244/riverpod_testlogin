import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_codium/homepage.dart';
import 'package:login_codium/loginpage.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
}

final screenSizeProvider = StateProvider<ScreenSize>(
  (ref) => ScreenSize.unknown,
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final screenSize = ref.watch(screenSizeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: const [
          Breakpoint(start: 0, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 800, name: TABLET),
          Breakpoint(start: 801, end: 1920, name: DESKTOP),
          Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        "/": (context) => LoginPage(),
        "homepage": (context) => HomePage(),
      },
      // routes: {
      //   "/": (context) => HomePage(),
      //    "homepage": (context) => const HomePage(),
      // },
    );
  }
}

enum ScreenSize {
  unknown,
  mobile,
  tablet,
  desktop,
}

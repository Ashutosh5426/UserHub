import 'package:flutter/material.dart';
import 'package:user_hub/core/shared_preference/shared_preference.dart';
import 'package:user_hub/features/login/ui/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
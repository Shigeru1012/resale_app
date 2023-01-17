
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resale_app/pages/home_page.dart';
import 'package:resale_app/pages/message_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'resale app',
          home: HomePage(),
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => MessageProvider())
        ]);
  }
}


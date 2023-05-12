import 'package:flutter/material.dart';
import 'package:hello_world_app/provider/theme_provider.dart';
import 'package:hello_world_app/screen/counter_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).theme(),
      home: const SafeArea(child: CounterScreen()),
    );
  }
}

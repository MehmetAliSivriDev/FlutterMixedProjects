import 'package:dio_provider_vs_calismasi/codes_with_provider/reqres_view_wprovider.dart';
import 'package:dio_provider_vs_calismasi/product/global/resource_context.dart';
import 'package:dio_provider_vs_calismasi/product/global/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
      )
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: context.watch<ThemeNotifier>().currentTheme,
        home: const ReqResViewWProvider());
  }
}

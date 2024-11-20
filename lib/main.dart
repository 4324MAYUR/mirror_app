import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/home/provider/homeprovider.dart';
import 'package:mirror_wall/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
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
      initialRoute: "home",
      routes: AllRoutes.appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
